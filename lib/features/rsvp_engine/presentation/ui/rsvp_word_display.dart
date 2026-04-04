// rsvp_word_display.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/rsvp_bloc.dart';

class RsvpWordDisplay extends StatelessWidget {
  const RsvpWordDisplay({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RsvpBloc, RsvpState>(
      builder: (context, state) {
        if (state.tokens.isEmpty) {
          return const Center(
            child: Text('Загрузите текст для чтения'),
          );
        }
        
        if (state.isCompleted) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, size: 64, color: Colors.green),
                SizedBox(height: 16),
                Text('Поздравляю! Текст прочитан!'),
              ],
            ),
          );
        }
        
        return Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: Text(
              state.currentToken?.text ?? '',
              key: ValueKey(state.currentToken?.index),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
