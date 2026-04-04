import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onTap,
    this.icon = Icons.add,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.height = 70,
    this.borderRadius = 16,
    super.key,
  });

  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final resolvedBackgroundColor = backgroundColor ?? appTheme?.secondaryColor ?? const Color(0xFF0057FF);
    final resolvedTextColor = textColor ?? theme.colorScheme.onPrimary;
    final resolvedIconColor = iconColor ?? resolvedTextColor;
    final resolvedTextStyle = (appTheme?.buttonTextStyle ?? theme.textTheme.labelLarge ?? const TextStyle()).copyWith(
      color: resolvedTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.25,
    );

    return Semantics(
      button: true,
      label: text,
      child: SizedBox(
        height: height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            splashFactory: NoSplash.splashFactory,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                color: resolvedBackgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: resolvedIconColor, size: 20),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: resolvedTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
