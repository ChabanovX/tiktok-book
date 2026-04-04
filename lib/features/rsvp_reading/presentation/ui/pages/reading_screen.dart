import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/bloc/reading_bloc.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/exit_button.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/start_stop_button.dart';


class ReadingScreenWrapper extends StatefulWidget {
  const ReadingScreenWrapper({
    required this.tokens,
    required this.bookTitle,
    super.key,
  });

  final List<RsvpToken> tokens;
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
    _readingBloc.close();
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
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
              final screenState = isPlaying 
                  ? ReadingScreenState.reading 
                  : ReadingScreenState.paused;
              
              return ReadingScreen(
                state: screenState,
                currentWord: currentToken.text,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Ошибка: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Назад'),
                  ),
                ],
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
    unawaited(showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выйти из чтения?'),
        content: const Text('Вы не закончили чтение книги. Прогресс будет потерян.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Выйти'),
          ),
        ],
      ),
    ));
  }

  void _showCompletionDialog(BuildContext context) {
    unawaited(showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Поздравляем! 🎉'),
        content: const Text('Вы успешно прочитали книгу!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Закрыть диалог
              Navigator.pop(context); // Вернуться на главный
            },
            child: const Text('Отлично!'),
          ),
        ],
      ),
    ));
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
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final clampedProgress = progress.clamp(0.0, 1.0);
    final progressTrackColor = (appTheme?.dividerColorMuted ?? theme.dividerColor).withValues(alpha: 0.24);
    final primaryControlBackgroundColor = (appTheme?.backgroundColor2 ?? theme.cardColor).withValues(alpha: 0.72);
    final exitControlBackgroundColor = appTheme?.backgroundColor2 ?? theme.cardColor;
    final metaTextColor =
        appTheme?.subTextStyle.color?.withValues(alpha: 0.72) ??
        appTheme?.stateDescriptionColor ??
        const Color(0xFF7A808A);
    final actionLabelColor = appTheme?.subTextStyle.color?.withValues(alpha: 0.58) ?? const Color(0xFF8B90A0);

    final currentWordStyle = (appTheme?.titleTextStyle ?? theme.textTheme.displayLarge ?? const TextStyle()).copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.1,
      color: appTheme?.mainTextStyle.color ?? theme.colorScheme.onSurface,
    );
    final bookTitleStyle = (appTheme?.mainTextStyle ?? theme.textTheme.titleLarge ?? const TextStyle()).copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: appTheme?.mainTextStyle.color ?? theme.colorScheme.onSurface,
    );
    final metaTextStyle = (appTheme?.subTextStyle ?? theme.textTheme.bodyMedium ?? const TextStyle()).copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.25,
      color: metaTextColor,
    );
    final actionLabelStyle = (appTheme?.buttonTextStyle ?? theme.textTheme.labelLarge ?? const TextStyle()).copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 2.2,
      height: 1.2,
      color: actionLabelColor,
    );

    return Scaffold(
      backgroundColor: appTheme?.backgroundColor ?? theme.scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            LinearProgressIndicator(
              value: clampedProgress,
              minHeight: 4,
              color: appTheme?.secondaryColor ?? theme.colorScheme.secondary,
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
                            style: currentWordStyle,
                          ),
                          const SizedBox(height: 56),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ReadingControl(
                                label: state == ReadingScreenState.reading ? 'PAUSE' : 'PLAY',
                                labelStyle: actionLabelStyle,
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
                                labelStyle: actionLabelStyle,
                                child: ExitButton(
                                  onTap: onExitTap,
                                  size: 60,
                                  borderRadius: 14,
                                  backgroundColor: exitControlBackgroundColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: bottomSpacing),
                          Text(
                            bookTitle,
                            textAlign: TextAlign.center,
                            style: bookTitleStyle,
                          ),
                          const SizedBox(height: 28),
                          Text(
                            '$progressLabel: ${(clampedProgress * 100).round()}%',
                            textAlign: TextAlign.center,
                            style: metaTextStyle,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            '$wordsReadLabel: $wordsRead',
                            textAlign: TextAlign.center,
                            style: metaTextStyle,
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
    required this.labelStyle,
  });

  final Widget child;
  final String label;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        const SizedBox(height: 14),
        Text(
          label,
          style: labelStyle,
        ),
      ],
    );
  }
}
