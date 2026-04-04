import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.size = 64,
    this.borderRadius = 16,
    super.key,
  });

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final resolvedBackgroundColor = backgroundColor ?? appTheme?.backgroundColor2 ?? Colors.white;
    final resolvedIconColor = iconColor ?? appTheme?.mainTextStyle.color ?? const Color(0xFF13191C);

    return Semantics(
      button: true,
      label: 'Exit',
      child: SizedBox(
        width: size,
        height: size,
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
              child: Center(
                child: Icon(
                  Icons.close_rounded,
                  key: const ValueKey('exit-button-icon'),
                  color: resolvedIconColor,
                  size: size * 0.42,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
