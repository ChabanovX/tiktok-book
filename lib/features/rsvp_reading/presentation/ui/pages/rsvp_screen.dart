// features/rsvp_reading/presentation/pages/reading_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/bloc/reading_bloc.dart';

class OldReadingScreen extends StatelessWidget {
  const OldReadingScreen({
    required this.tokens,
    required this.bookTitle,
    super.key,
  });

  final List<RsvpToken> tokens;
  final String bookTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReadingBloc>(),
      child: ReadingScreenContent(
        tokens: tokens,
        bookTitle: bookTitle,
      ),
    );
  }
}

class ReadingScreenContent extends StatefulWidget {
  const ReadingScreenContent({
    required this.tokens,
    required this.bookTitle,
    super.key,
  });

  final List<RsvpToken> tokens;
  final String bookTitle;

  @override
  State<ReadingScreenContent> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreenContent> {
  @override
  void initState() {
    super.initState();
    unawaited(
      Future.microtask(() {
        if (mounted) {
          context.read<ReadingBloc>().add(
            ReadingEvent.initialize(
              tokens: widget.tokens,
            ),
          );
        }
      }),
    );
  }

  @override
  void dispose() {
    context.read<ReadingBloc>().add(const ReadingEvent.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Открыть настройки скорости
            },
          ),
        ],
      ),
      body: BlocConsumer<ReadingBloc, ReadingState>(
        listener: (context, state) {
          state.maybeWhen(
            ready: (tokens, currentToken, wpm, totalWords, isPlaying, isCompleted, progress) {
              if (isCompleted) {
                _showCompletionDialog(context);
              }
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            ready: (tokens, currentToken, wpm, totalWords, isPlaying, isCompleted, progress) {
              return Column(
                children: [
                  LinearProgressIndicator(value: progress),

                  Expanded(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: Text(
                          currentToken.text,
                          key: ValueKey(currentToken.index),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  _buildControls(
                    context: context,
                    isPlaying: isPlaying,
                    wpm: wpm,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    '${currentToken.index + 1} / $totalWords слов',
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 32),
                ],
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
              child: Text('Подготовка к чтению...'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildControls({
    required BuildContext context,
    required bool isPlaying,
    required int wpm,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.skip_previous, size: 40),
          onPressed: () {
            context.read<ReadingBloc>().add(const ReadingEvent.previous());
          },
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 48,
              color: Colors.white,
            ),
            onPressed: () {
              if (isPlaying) {
                context.read<ReadingBloc>().add(const ReadingEvent.pause());
              } else {
                context.read<ReadingBloc>().add(const ReadingEvent.resume());
              }
            },
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.skip_next, size: 40),
          onPressed: () {
            context.read<ReadingBloc>().add(const ReadingEvent.next());
          },
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<int>(
              value: wpm,
              items: [200, 250, 300, 350, 400, 450, 500].map((speed) {
                return DropdownMenuItem(
                  value: speed,
                  child: Text('$speed WPM'),
                );
              }).toList(),
              onChanged: (newWpm) {
                if (newWpm != null) {
                  context.read<ReadingBloc>().add(ReadingEvent.changeWpm(newWpm));
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showCompletionDialog(BuildContext context) {
    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Поздравляем!'),
          content: const Text('Вы успешно прочитали книгу!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Отлично!'),
            ),
          ],
        ),
      ),
    );
  }
}
