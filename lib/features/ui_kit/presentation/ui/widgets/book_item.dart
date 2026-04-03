import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    required this.title,
    required this.author,
    required this.progress,
    this.onTap,
    this.icon = Icons.menu_book_outlined,
    this.backgroundColor,
    this.shadowColor,
    this.iconBackgroundColor,
    this.iconColor,
    this.titleColor,
    this.authorColor,
    this.progressBarColor,
    this.progressTrackColor,
    this.progressTextColor,
    this.finishedTextColor,
    this.completedBadgeColor,
    this.completedIconColor,
    this.finishedLabel = 'FINISHED',
    super.key,
  });

  final String title;
  final String author;
  final double progress;
  final VoidCallback? onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final Color? authorColor;
  final Color? progressBarColor;
  final Color? progressTrackColor;
  final Color? progressTextColor;
  final Color? finishedTextColor;
  final Color? completedBadgeColor;
  final Color? completedIconColor;
  final String finishedLabel;

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final isFinished = clampedProgress >= 1;
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();

    final resolvedBackgroundColor = backgroundColor ?? appTheme?.backgroundColor2 ?? Colors.white;
    final resolvedShadowColor = shadowColor ?? const Color(0x14000000);
    final resolvedIconBackgroundColor = iconBackgroundColor ?? appTheme?.backgroundColor ?? const Color(0xFFF1F4F9);
    final resolvedIconColor = iconColor ?? appTheme?.primaryColor.withValues(alpha: 0.35) ?? const Color(0xFF98ABC6);
    final resolvedTitleColor = titleColor ?? appTheme?.mainTextStyle.color ?? const Color(0xFF18181B);
    final resolvedAuthorColor =
        authorColor ?? appTheme?.subTextStyle.color?.withValues(alpha: 0.85) ?? const Color(0xFF5E6470);
    final resolvedProgressBarColor = progressBarColor ?? appTheme?.secondaryColor ?? const Color(0xFF1D4ED8);
    final resolvedProgressTrackColor = progressTrackColor ?? appTheme?.backgroundColor ?? const Color(0xFFE5E7EB);
    final resolvedProgressTextColor = progressTextColor ?? appTheme?.subTextStyle.color ?? const Color(0xFF5E6470);
    final resolvedFinishedTextColor =
        finishedTextColor ?? appTheme?.subTextStyle.color?.withValues(alpha: 0.65) ?? const Color(0xFFB4B9C3);
    final resolvedCompletedBadgeColor = completedBadgeColor ?? appTheme?.secondaryColor ?? const Color(0xFF0A53D9);
    final resolvedCompletedIconColor = completedIconColor ?? theme.colorScheme.onPrimary;

    final titleStyle = (appTheme?.mainTextStyle ?? theme.textTheme.titleLarge ?? const TextStyle()).copyWith(
      color: resolvedTitleColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.2,
    );
    final authorStyle = (appTheme?.subTextStyle ?? theme.textTheme.bodyMedium ?? const TextStyle()).copyWith(
      color: resolvedAuthorColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
    );
    final progressStyle = (appTheme?.subTextStyle ?? theme.textTheme.bodyMedium ?? const TextStyle()).copyWith(
      color: resolvedProgressTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
    final finishedStyle = (appTheme?.subTextStyle ?? theme.textTheme.bodyMedium ?? const TextStyle()).copyWith(
      color: resolvedFinishedTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.48,
      height: 1.2,
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: const BoxConstraints(minHeight: 114),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: resolvedBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: resolvedShadowColor,
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 64,
              decoration: BoxDecoration(
                color: resolvedIconBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: resolvedIconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (isFinished)
                        _CompletedBadge(
                          backgroundColor: resolvedCompletedBadgeColor,
                          iconColor: resolvedCompletedIconColor,
                        )
                      else
                        Text(
                          '${(clampedProgress * 100).round()}%',
                          style: progressStyle,
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: authorStyle,
                  ),
                  const SizedBox(height: 14),
                  if (isFinished)
                    Text(
                      finishedLabel,
                      style: finishedStyle,
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: clampedProgress,
                        minHeight: 4,
                        color: resolvedProgressBarColor,
                        backgroundColor: resolvedProgressTrackColor,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompletedBadge extends StatelessWidget {
  const _CompletedBadge({
    required this.backgroundColor,
    required this.iconColor,
  });

  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check_rounded, color: iconColor, size: 16),
    );
  }
}
