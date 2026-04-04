import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    required this.title,
    required this.author,
    required this.progress,
    this.onTap,
    this.icon = Icons.menu_book_outlined,
    this.backgroundColor = Colors.white,
    this.shadowColor = const Color(0x14000000),
    this.iconBackgroundColor = const Color(0xFFF1F4F9),
    this.iconColor = const Color(0xFF98ABC6),
    this.titleColor = const Color(0xFF18181B),
    this.authorColor = const Color(0xFF5E6470),
    this.progressBarColor = const Color(0xFF1D4ED8),
    this.progressTrackColor = const Color(0xFFE5E7EB),
    this.progressTextColor = const Color(0xFF5E6470),
    this.finishedTextColor = const Color(0xFFB4B9C3),
    this.completedBadgeColor = const Color(0xFF0A53D9),
    this.completedIconColor = Colors.white,
    this.finishedLabel = 'FINISHED',
    super.key,
  });

  final String title;
  final String author;
  final double progress;
  final VoidCallback? onTap;
  final IconData icon;
  final Color backgroundColor;
  final Color shadowColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color authorColor;
  final Color progressBarColor;
  final Color progressTrackColor;
  final Color progressTextColor;
  final Color finishedTextColor;
  final Color completedBadgeColor;
  final Color completedIconColor;
  final String finishedLabel;

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final isFinished = clampedProgress >= 1;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: const BoxConstraints(minHeight: 114),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
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
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24),
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
                          style: TextStyle(
                            color: titleColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (isFinished)
                        _CompletedBadge(
                          backgroundColor: completedBadgeColor,
                          iconColor: completedIconColor,
                        )
                      else
                        Text(
                          '${(clampedProgress * 100).round()}%',
                          style: TextStyle(
                            color: progressTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: authorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 14),
                  if (isFinished)
                    Text(
                      finishedLabel,
                      style: TextStyle(
                        color: finishedTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.48,
                        height: 1.2,
                      ),
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: clampedProgress,
                        minHeight: 4,
                        color: progressBarColor,
                        backgroundColor: progressTrackColor,
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
