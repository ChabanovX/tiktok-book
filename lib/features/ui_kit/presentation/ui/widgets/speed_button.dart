import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class SpeedButton extends StatelessWidget {
  const SpeedButton({
    required this.wpm,
    this.onTap,
    this.height = 56,
    this.borderRadius = 24,
    this.icon = Icons.speed_outlined,
    this.suffixIcon = Icons.arrow_drop_down,
    this.backgroundColor,
    this.horizontalPadding = 16,
    this.gap = 12,
    this.labelSuffix = 'WPM',
    super.key,
  });

  final int wpm;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;
  final IconData icon;
  final IconData suffixIcon;
  final Color? backgroundColor;
  final double horizontalPadding;
  final double gap;
  final String labelSuffix;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final resolvedBackgroundColor = backgroundColor ?? appTheme.backgroundColor2;
    final textColor = appTheme.mainTextStyle.color ?? Colors.black;

    return Semantics(
      button: true,
      label: 'Reading speed $wpm $labelSuffix',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          splashFactory: NoSplash.splashFactory,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: Ink(
            height: height,
            decoration: BoxDecoration(
              color: resolvedBackgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 28,
                  color: textColor,
                ),
                SizedBox(width: gap),
                Text(
                  '$wpm $labelSuffix',
                  style: appTheme.buttonTextStyle.copyWith(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(width: gap * 0.5),
                Icon(
                  suffixIcon,
                  size: 28,
                  color: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
