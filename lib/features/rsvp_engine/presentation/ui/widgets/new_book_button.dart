import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class NewBookButton extends StatelessWidget {
  const NewBookButton({
    this.onTap,
    this.label,
    super.key,
  });

  final VoidCallback? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final resolvedLabel = label ?? context.l10n.newBookButtonLabel;
    final borderColor =
        appTheme?.addBookCardBorderColor ??
        (appTheme?.secondaryColor ?? theme.colorScheme.secondary).withValues(alpha: 0.28);
    final backgroundColor =
        appTheme?.addBookCardBackgroundColor ??
        (appTheme?.secondaryColor ?? theme.colorScheme.secondary).withValues(alpha: 0.06);
    final labelStyle = (appTheme?.buttonTextStyle ?? theme.textTheme.labelLarge ?? const TextStyle()).copyWith(
      color: appTheme?.primaryColor ?? theme.colorScheme.primary,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
    );

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 74,
        width: double.infinity,
        child: DashedBorderContainer(
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: appTheme?.secondaryColor ?? theme.colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Text(resolvedLabel, style: labelStyle),
            ],
          ),
        ),
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
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
