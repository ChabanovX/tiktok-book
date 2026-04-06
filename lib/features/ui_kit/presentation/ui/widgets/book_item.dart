import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rsvp_flutter_app/core/constants.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    required this.title,
    required this.author,
    required this.progress,
    this.onTap,
    this.onDelete,
    this.isSelected = false,
    this.icon = Icons.menu_book_outlined,
    this.finishedLabel,
    super.key,
  });

  static const Duration _selectionAnimationDuration = Constants.basicAnimationDuration;
  static const Curve _selectionAnimationCurve = Constants.basicAnimationCurve;

  final String title;
  final String author;
  final double progress;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isSelected;
  final IconData icon;
  final String? finishedLabel;

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final isFinished = clampedProgress >= 1;
    final theme = Theme.of(context);
    final appTheme = context.appTheme;
    final resolvedFinishedLabel = finishedLabel ?? context.l10n.bookItemFinished;
    final borderRadius = BorderRadius.circular(16);
    final decoration = isSelected
        ? BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: appTheme.secondaryColor.withValues(alpha: 0.22),
            ),
            boxShadow: [
              BoxShadow(
                color: appTheme.primaryColor.withValues(alpha: 0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: appTheme.secondaryColor.withValues(alpha: 0.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          )
        : BoxDecoration(
            color: appTheme.backgroundColor2,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: appTheme.stateCardShadowColor,
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          );
    final coverDecoration = BoxDecoration(
      color: isSelected ? appTheme.backgroundColor2.withValues(alpha: 0.72) : appTheme.backgroundColor,
      borderRadius: BorderRadius.circular(8),
    );

    final card = GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: _selectionAnimationDuration,
        curve: _selectionAnimationCurve,
        constraints: const BoxConstraints(minHeight: 114),
        padding: const EdgeInsets.all(16),
        decoration: decoration,
        child: Row(
          children: [
            AnimatedContainer(
              duration: _selectionAnimationDuration,
              curve: _selectionAnimationCurve,
              height: 80,
              width: 64,
              decoration: coverDecoration,
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
                        resolvedFinishedLabel,
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

    if (onDelete == null) {
      return card;
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.28,
        children: [
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: appTheme.desctructionColor,
            foregroundColor: theme.colorScheme.onSecondary,
            icon: Icons.delete_outline_rounded,
            label: context.l10n.bookItemDelete,
            borderRadius: borderRadius,
          ),
        ],
      ),
      child: card,
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
