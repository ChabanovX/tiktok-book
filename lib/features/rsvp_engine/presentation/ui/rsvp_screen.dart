// rsvp_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/rsvp_word_display.dart';

class RsvpScreen extends StatefulWidget {
  const RsvpScreen({super.key});
  
  @override
  State<RsvpScreen> createState() => _RsvpScreenState();
}

class _RsvpScreenState extends State<RsvpScreen> {
  final TextEditingController _textController = TextEditingController();
  
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSVP Чтение'),
      ),
      body: BlocProvider(
        create: (_) => RsvpBloc(),
        child: RsvpView(textController: _textController,),
      ),
    );
  }
}

class RsvpView extends StatelessWidget {
  const RsvpView({required this.textController, super.key});

  final TextEditingController textController;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[100],
            child: const RsvpWordDisplay(),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const WpmSlider(),
              const ControlButtons(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Введите текст для чтения...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          context.read<RsvpBloc>().add(
                            LoadTextEvent(
                              text: textController.text,
                              initialWpm: 300,
                            ),
                          );
                          context.read<RsvpBloc>().add(StartRsvpEvent());
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WpmSlider extends StatelessWidget {
  const WpmSlider({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RsvpBloc, RsvpState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              'Скорость: ${state.wpm} слов/мин',
              style: const TextStyle(fontSize: 16),
            ),
            Slider(
              value: state.wpm.toDouble(),
              min: 100,
              max: 1000,
              divisions: 90,
              label: '${state.wpm} WPM',
              onChanged: (value) {
                context.read<RsvpBloc>().add(ChangeWpmEvent(value.toInt()));
              },
            ),
          ],
        );
      },
    );
  }
}

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RsvpBloc, RsvpState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous, size: 36),
              onPressed: state.tokens.isEmpty
                  ? null
                  : () => context.read<RsvpBloc>().add(PreviousWordEvent()),
            ),
            const SizedBox(width: 20),
            if (!state.isPlaying)
              IconButton(
                icon: const Icon(Icons.play_arrow, size: 48),
                onPressed: state.tokens.isEmpty || state.isCompleted
                    ? null
                    : () => context.read<RsvpBloc>().add(ResumeRsvpEvent()),
              )
            else
              IconButton(
                icon: const Icon(Icons.pause, size: 48),
                onPressed: () => context.read<RsvpBloc>().add(PauseRsvpEvent()),
              ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.skip_next, size: 36),
              onPressed: state.tokens.isEmpty
                  ? null
                  : () => context.read<RsvpBloc>().add(NextWordEvent()),
            ),
          ],
        );
      },
    );
  }
}
