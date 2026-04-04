import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    required this.title,
    required this.author,
    required this.progress,
    this.onTap,
    this.icon = Icons.menu_book_outlined,
    this.finishedLabel = 'FINISHED',
    super.key,
  });

  final String title;
  final String author;
  final double progress;
  final VoidCallback? onTap;
  final IconData icon;
  final String finishedLabel;

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final isFinished = clampedProgress >= 1;
    final theme = Theme.of(context);
    final appTheme = context.appTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: const BoxConstraints(minHeight: 114),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appTheme.backgroundColor2,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: appTheme.stateCardShadowColor,
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
                color: appTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: appTheme.primaryColor.withValues(alpha: 0.35),
                size: 24,
              ),
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
                          style: appTheme.mainTextStyle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (isFinished)
                        _CompletedBadge(
                          backgroundColor: appTheme.secondaryColor,
                          iconColor: theme.colorScheme.onSecondary,
                        )
                      else
                        Text(
                          '${(clampedProgress * 100).round()}%',
                          style: appTheme.subTextStyle,
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Opacity(
                    opacity: 0.85,
                    child: Text(
                      author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTheme.subTextStyle,
                    ),
                  ),
                  const SizedBox(height: 14),
                  if (isFinished)
                    Opacity(
                      opacity: 0.65,
                      child: Text(
                        finishedLabel,
                        style: appTheme.subTextStyle,
                      ),
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: clampedProgress,
                        minHeight: 4,
                        color: appTheme.secondaryColor,
                        backgroundColor: appTheme.backgroundColor,
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
