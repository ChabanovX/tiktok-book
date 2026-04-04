import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/exit_button.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/start_stop_button.dart';

enum ReadingScreenState {
  reading,
  paused,
}

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({
    required this.state,
    required this.currentWord,
    required this.bookTitle,
    required this.progress,
    required this.wordsRead,
    this.onStartStopTap,
    this.onExitTap,
    this.progressLabel = 'Current progress',
    this.wordsReadLabel = 'Words read',
    super.key,
  });

  final ReadingScreenState state;
  final String currentWord;
  final String bookTitle;
  final double progress;
  final int wordsRead;
  final VoidCallback? onStartStopTap;
  final VoidCallback? onExitTap;
  final String progressLabel;
  final String wordsReadLabel;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final clampedProgress = progress.clamp(0.0, 1.0);
    final progressTrackColor = appTheme.dividerColorMuted.withValues(alpha: 0.24);
    final primaryControlBackgroundColor = appTheme.backgroundColor2.withValues(alpha: 0.72);

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            LinearProgressIndicator(
              value: clampedProgress,
              minHeight: 4,
              color: appTheme.secondaryColor,
              backgroundColor: progressTrackColor,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final topSpacing = (constraints.maxHeight * 0.22).clamp(72.0, 168.0);
                  final bottomSpacing = (constraints.maxHeight * 0.18).clamp(56.0, 144.0);

                  return SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        children: [
                          SizedBox(height: topSpacing),
                          Text(
                            currentWord,
                            textAlign: TextAlign.center,
                            style: appTheme.titleTextStyle,
                          ),
                          const SizedBox(height: 56),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ReadingControl(
                                label: state == ReadingScreenState.reading ? 'PAUSE' : 'PLAY',
                                child: StartStopButton(
                                  isRunning: state == ReadingScreenState.reading,
                                  onTap: onStartStopTap,
                                  size: 60,
                                  borderRadius: 14,
                                  backgroundColor: primaryControlBackgroundColor,
                                ),
                              ),
                              const SizedBox(width: 18),
                              _ReadingControl(
                                label: 'EXIT',
                                child: ExitButton(
                                  onTap: onExitTap,
                                  size: 60,
                                  borderRadius: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: bottomSpacing),
                          Text(
                            bookTitle,
                            textAlign: TextAlign.center,
                            style: appTheme.mainTextStyle,
                          ),
                          const SizedBox(height: 28),
                          Opacity(
                            opacity: 0.72,
                            child: Text(
                              '$progressLabel: ${(clampedProgress * 100).round()}%',
                              textAlign: TextAlign.center,
                              style: appTheme.subTextStyle,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Opacity(
                            opacity: 0.72,
                            child: Text(
                              '$wordsReadLabel: $wordsRead',
                              textAlign: TextAlign.center,
                              style: appTheme.subTextStyle,
                            ),
                          ),
                          SizedBox(height: bottomSpacing),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadingControl extends StatelessWidget {
  const _ReadingControl({
    required this.child,
    required this.label,
  });

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        const SizedBox(height: 14),
        Opacity(
          opacity: 0.58,
          child: Text(
            label,
            style: appTheme.buttonTextStyle,
          ),
        ),
      ],
    );
  }
}
