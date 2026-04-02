import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:rsvp_flutter_app/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/domain/usecases/import_book_file.dart';

class NewBookButton extends StatelessWidget {
  const NewBookButton({
    required this.importBookFile,
    super.key,
  });

  final ImportBookFile importBookFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final loadedBook = await importBookFile();
          logger.i('Success! Loaded ${loadedBook?.name}, size: ${loadedBook?.size}');

          if (context.mounted && loadedBook != null) {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _LoadedBookPage(book: loadedBook),
              ),
            );
          }
        } on Exception catch (e) {
          logger.e(e);
        }
      },

      child: SizedBox(
        height: 74,
        width: double.infinity,
        child: DashedBorderContainer(
          borderColor: const Color(0x4C0043C8),
          backgroundColor: const Color(0x0C0057FF),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF0057FF),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
              const SizedBox(width: 16),
              const Text('Add New Book', style: TextStyle(color: Color(0xFF0043C8))),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadedBookPage extends StatelessWidget {
  const _LoadedBookPage({required this.book});

  final BookFile book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loaded File')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            _BookInfoTile(label: 'Path', value: book.path),
            _BookInfoTile(label: 'Extension', value: book.fileExtension),
            _BookInfoTile(label: 'Size', value: '${book.size} bytes'),
          ],
        ),
      ),
    );
  }
}

class _BookInfoTile extends StatelessWidget {
  const _BookInfoTile({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}

class DashedBorderContainer extends StatelessWidget {
  const DashedBorderContainer({
    required this.child,
    this.borderColor = Colors.blue,
    this.borderWidth = 2,
    this.borderRadius = 16,
    this.backgroundColor = Colors.blue,
    this.dashWidth = 8,
    this.dashSpace = 4,
    super.key,
  });

  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final double dashWidth;
  final double dashSpace;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        borderColor: borderColor,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        constraints: const BoxConstraints(minWidth: 200, minHeight: 100),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.backgroundColor,
    required this.dashWidth,
    required this.dashSpace,
  });

  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final double dashWidth;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(
      borderWidth / 2,
      borderWidth / 2,
      size.width - borderWidth,
      size.height - borderWidth,
    );

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrect, backgroundPaint);

    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics().toList();

    for (final metric in metrics) {
      double start = 0;
      while (start < metric.length) {
        final end = (start + dashWidth).clamp(0.0, metric.length);
        final segment = metric.extractPath(start, end);
        canvas.drawPath(segment, paint);
        start += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
