import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onTap,
    this.icon = Icons.add,
    this.height = 70,
    this.borderRadius = 16,
    super.key,
  });

  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    // final buttonTextColor = appTheme.buttonTextStyle.color;
    const buttonTextColor = Colors.white;

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
                color: appTheme.secondaryColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: buttonTextColor, size: 20),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        // TODO: add theme for this text.
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: appTheme.buttonTextStyle.copyWith(color: buttonTextColor),
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
