import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/bloc/reading_bloc.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/exit_button.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/start_stop_button.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class ReadingScreenWrapper extends StatefulWidget {
  const ReadingScreenWrapper({
    required this.tokens,
    required this.bookTitle,
    super.key,
  });

  final List<RsvpBionicToken> tokens;
  final String bookTitle;

  @override
  State<ReadingScreenWrapper> createState() => _ReadingScreenWrapperState();
}

class _ReadingScreenWrapperState extends State<ReadingScreenWrapper> {
  late final ReadingBloc _readingBloc;

  @override
  void initState() {
    super.initState();
    _readingBloc = getIt<ReadingBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _readingBloc.add(
          ReadingEvent.initialize(
            tokens: widget.tokens,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _readingBloc.add(const ReadingEvent.dispose());
    unawaited(_readingBloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _readingBloc,
      child: BlocConsumer<ReadingBloc, ReadingState>(
        listener: (context, state) {
          state.maybeWhen(
            ready: (_, _, _, _, _, isCompleted, _) {
              if (isCompleted) {
                _showCompletionDialog(context);
              }
            },
            error: (message) {
              final localizedMessage = _localizeErrorMessage(context, message);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localizedMessage),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            ready: (tokens, currentToken, wpm, totalWords, isPlaying, isCompleted, progress) {
              final screenState = isPlaying ? ReadingScreenState.reading : ReadingScreenState.paused;

              return ReadingScreen(
                state: screenState,
                currentWord: currentToken,
                bookTitle: widget.bookTitle,
                progress: progress,
                wordsRead: currentToken.index + 1,
                onStartStopTap: () {
                  if (isPlaying) {
                    _readingBloc.add(const ReadingEvent.pause());
                  } else {
                    _readingBloc.add(const ReadingEvent.resume());
                  }
                },
                onExitTap: () => _onExit(context),
              );
            },
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(
              child: Builder(
                builder: (context) {
                  final l10n = context.l10n;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 64, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(l10n.readingErrorMessage(_localizeErrorMessage(context, message))),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(l10n.commonBack),
                      ),
                    ],
                  );
                },
              ),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  void _onExit(BuildContext context) {
    getIt<NavigationService>().pop();
  }

  void _showCompletionDialog(BuildContext context) {
    final l10n = context.l10n;

    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(l10n.readingCompletedTitle),
          content: Text(l10n.readingCompletedMessage),
          actions: [
            TextButton(
              onPressed: () {
                getIt<NavigationService>().pop();
              },
              child: Text(l10n.readingCompletedAction),
            ),
          ],
        ),
      ),
    );
  }

  String _localizeErrorMessage(BuildContext context, String message) {
    final l10n = context.l10n;

    switch (message) {
      case readingEmptyTextErrorKey:
        return l10n.readingErrorEmptyText;
      default:
        return message;
    }
  }
}

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
    super.key,
  });

  final ReadingScreenState state;
  final RsvpBionicToken currentWord;
  final String bookTitle;
  final double progress;
  final int wordsRead;
  final VoidCallback? onStartStopTap;
  final VoidCallback? onExitTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final l10n = context.l10n;
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
                  final totalHeight = constraints.maxHeight;

                  final halfHeight = (totalHeight - 56) / 2;

                  final topSpacing = (constraints.maxHeight * 0.10).clamp(72.0, 168.0);
                  final bottomSpacing = (constraints.maxHeight * 0.18).clamp(56.0, 144.0);

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        children: [
                          SizedBox(
                            height: halfHeight - 14,
                            child: Column(
                              children: [
                                SizedBox(height: topSpacing),
                                Text(
                                  bookTitle,
                                  textAlign: TextAlign.center,
                                  style: appTheme.bookTitleText,
                                ),
                                const SizedBox(height: 21),
                                Opacity(
                                  opacity: 0.72,
                                  child: Text(
                                    l10n.readingProgress((clampedProgress * 100).round()),
                                    textAlign: TextAlign.center,
                                    style: appTheme.subTextStyle,
                                  ),
                                ),
                                const SizedBox(height: 21),
                                Opacity(
                                  opacity: 0.72,
                                  child: Text(
                                    l10n.readingWordsRead(wordsRead),
                                    textAlign: TextAlign.center,
                                    style: appTheme.subTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 56,
                            child: Center(
                              child: BionicWordWidget(
                                token: currentWord,
                                boldStyle: appTheme.titleTextStyle.copyWith(color: appTheme.primaryColor),
                                semiboldStyle: appTheme.rsvpTextStyleSemiBold.copyWith(color: appTheme.primaryColor),
                                baseStyle: appTheme.rsvpTextStyleRegular,
                              ),
                              // Text(
                              //   currentWord,
                              //   textAlign: TextAlign.center,
                              //   style: appTheme.titleTextStyle,
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: halfHeight + 14,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _ReadingControl(
                                      label: state == ReadingScreenState.reading
                                          ? l10n.readingControlPause
                                          : l10n.readingControlPlay,
                                      child: StartStopButton(
                                        isRunning: state == ReadingScreenState.reading,
                                        onTap: onStartStopTap,
                                        size: 60,
                                        borderRadius: 14,
                                        backgroundColor: primaryControlBackgroundColor,
                                      ),
                                    ),
                                    const SizedBox(width: 48),
                                    _ReadingControl(
                                      label: l10n.readingControlExit,
                                      child: ExitButton(
                                        onTap: onExitTap,
                                        size: 60,
                                        borderRadius: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: bottomSpacing),
                              ],
                            ),
                          ),
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

class BionicWordWidget extends StatelessWidget {
  const BionicWordWidget({
    required this.token,
    required this.baseStyle,
    this.boldStyle,
    this.semiboldStyle,
    this.textAlign = TextAlign.center,
    super.key,
  });

  final RsvpBionicToken token;
  final TextStyle baseStyle;
  final TextStyle? boldStyle;
  final TextStyle? semiboldStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: token.boldText,
            style: (boldStyle ?? baseStyle).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: token.semiboldText,
            style: (semiboldStyle ?? baseStyle).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: token.regularText,
            style: baseStyle.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
