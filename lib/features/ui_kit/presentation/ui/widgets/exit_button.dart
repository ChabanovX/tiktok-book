import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    this.onTap,
    this.size = 64,
    this.borderRadius = 16,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

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
                color: appTheme.backgroundColor2,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Icon(
                  Icons.close_rounded,
                  key: const ValueKey('exit-button-icon'),
                  color: appTheme.mainTextStyle.color,
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
