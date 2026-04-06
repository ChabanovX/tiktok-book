import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({
    required this.isRunning,
    this.onTap,
    this.backgroundColor,
    this.size = 120,
    this.borderRadius = 32,
    super.key,
  });

  final bool isRunning;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final resolvedBackgroundColor = backgroundColor ?? appTheme.backgroundColor2;

    return Semantics(
      button: true,
      label: isRunning ? context.l10n.startStopPauseSemantic : context.l10n.startStopPlaySemantic,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Ink(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: resolvedBackgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: isRunning
                    ? _PauseIcon(
                        key: const ValueKey('start-stop-pause-icon'),
                        color: appTheme.mainTextStyle.color!,
                        buttonSize: size,
                      )
                    : _PlayIcon(
                        key: const ValueKey('start-stop-play-icon'),
                        color: appTheme.mainTextStyle.color!,
                        buttonSize: size,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayIcon extends StatelessWidget {
  const _PlayIcon({
    required this.color,
    required this.buttonSize,
    super.key,
  });

  final Color color;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(buttonSize * 0.03, 0),
      child: Icon(
        Icons.play_arrow_rounded,
        color: color,
        size: buttonSize * 0.46,
      ),
    );
  }
}

class _PauseIcon extends StatelessWidget {
  const _PauseIcon({
    required this.color,
    required this.buttonSize,
    super.key,
  });

  final Color color;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    final barHeight = buttonSize * 0.44;
    final barWidth = buttonSize * 0.15;
    final borderWidth = buttonSize * 0.04;
    final spacing = buttonSize * 0.10;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PauseBar(
          color: color,
          height: barHeight,
          width: barWidth,
          borderWidth: borderWidth,
        ),
        SizedBox(width: spacing),
        _PauseBar(
          color: color,
          height: barHeight,
          width: barWidth,
          borderWidth: borderWidth,
        ),
      ],
    );
  }
}

class _PauseBar extends StatelessWidget {
  const _PauseBar({
    required this.color,
    required this.height,
    required this.width,
    required this.borderWidth,
  });

  final Color color;
  final double height;
  final double width;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: borderWidth),
        borderRadius: BorderRadius.circular(borderWidth),
      ),
    );
  }
}
