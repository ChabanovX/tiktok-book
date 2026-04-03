import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class LibraryMainScreen extends StatelessWidget {
  const LibraryMainScreen({
    required this.bookItems,
    this.onAddBookTap,
    this.appBarTitle = 'Book Fast Track TT HZ',
    this.collectionTitle = 'Personal Collection',
    this.addBookLabel = 'ADD NEW BOOK',
    super.key,
  });

  final List<Widget> bookItems;
  final VoidCallback? onAddBookTap;
  final String appBarTitle;
  final String collectionTitle;
  final String addBookLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final appBarTextStyle = (appTheme?.appBarTitleTextStyle ?? theme.textTheme.displayMedium ?? const TextStyle())
        .copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: appTheme?.mainTextStyle.color ?? const Color(0xFF111827),
        );
    final titleStyle = (appTheme?.titleTextStyle ?? theme.textTheme.displayLarge ?? const TextStyle()).copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.15,
    );

    return Scaffold(
      backgroundColor: appTheme?.backgroundColor2 ?? theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appTheme?.backgroundColor2 ?? theme.cardColor,
                border: Border(
                  bottom: BorderSide(
                    color: theme.dividerColor.withValues(alpha: 0.18),
                  ),
                ),
              ),
              child: Text(
                appBarTitle,
                style: appBarTextStyle,
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
                children: [
                  Text(
                    collectionTitle,
                    style: titleStyle,
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: appTheme?.secondaryColor ?? theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  const SizedBox(height: 18),
                  _AddBookCard(
                    label: addBookLabel,
                    onTap: onAddBookTap,
                  ),
                  const SizedBox(height: 18),
                  if (bookItems.isEmpty)
                    _EmptyState(
                      textStyle: theme.textTheme.bodyMedium ?? const TextStyle(),
                    )
                  else
                    ..._buildSeparatedItems(bookItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSeparatedItems(List<Widget> items) {
    final result = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        result.add(const SizedBox(height: 18));
      }
    }

    return result;
  }
}

class _AddBookCard extends StatelessWidget {
  const _AddBookCard({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final borderColor = (appTheme?.secondaryColor ?? theme.colorScheme.secondary).withValues(alpha: 0.28);
    final backgroundColor = (appTheme?.secondaryColor ?? theme.colorScheme.secondary).withValues(alpha: 0.06);
    final labelStyle = (appTheme?.buttonTextStyle ?? theme.textTheme.labelLarge ?? const TextStyle()).copyWith(
      color: appTheme?.primaryColor ?? theme.colorScheme.primary,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
    );

    return CustomPaint(
      painter: _DashedBorderPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        borderRadius: 16,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashFactory: NoSplash.splashFactory,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: appTheme?.secondaryColor ?? theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: labelStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({
    required this.borderColor,
    required this.backgroundColor,
    required this.borderRadius,
  });

  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;

  static const _borderWidth = 1.0;
  static const _dashWidth = 6.0;
  static const _dashSpace = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      _borderWidth / 2,
      _borderWidth / 2,
      size.width - _borderWidth,
      size.height - _borderWidth,
    );
    final rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final fillPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(rRect, fillPaint);

    final strokePaint = Paint()
      ..color = borderColor
      ..strokeWidth = _borderWidth
      ..style = PaintingStyle.stroke;

    final path = Path()..addRRect(rRect);
    for (final metric in path.computeMetrics()) {
      var start = 0.0;
      while (start < metric.length) {
        final end = (start + _dashWidth).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(start, end), strokePaint);
        start += _dashWidth + _dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.borderRadius != borderRadius;
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Text(
          'No books yet',
          style: textStyle.copyWith(
            fontSize: 16,
            color: textStyle.color?.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
