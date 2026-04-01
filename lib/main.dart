import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/rsvpTokenModel.dart';
import 'package:rsvp_flutter_app/rsvpTokenizer.dart';
import 'package:rsvp_flutter_app/rsvpEngine.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RsvpReaderScreen(
      text: "Это пример текста для RSVP режима чтения",
    );
  }
}

class RsvpReaderScreen extends StatefulWidget {
  final String text;

  const RsvpReaderScreen({
    super.key,
    required this.text,
  });

  @override
  State<RsvpReaderScreen> createState() => _RsvpReaderScreenState();
}

class _RsvpReaderScreenState extends State<RsvpReaderScreen> {
  late final List<RsvpToken> _tokens;

  RsvpEngine? _engine;

  String _currentWord = '';
  int _wpm = 300;
  bool _isStarted = false;

  @override
  void initState() {
    super.initState();
    _tokens = RsvpTokenizer().tokenize(widget.text);
  }

  void _createEngine() {
    _engine?.stop();

    _engine = RsvpEngine(
      tokens: _tokens,
      wpm: _wpm,
      onTokenChanged: (token) {
        setState(() {
          _currentWord = token.text;
        });
      },
      onCompleted: () {
        setState(() {});
      },
    );
  }

  void _start() {
    _createEngine();
    _engine?.start();

    setState(() {
      _isStarted = true;
    });
  }

  void _pause() {
    _engine?.pause();
    setState(() {});
  }

  void _resume() {
    _engine?.resume();
    setState(() {});
  }

  @override
  void dispose() {
    _engine?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = _engine?.isPlaying ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('RSVP Reader')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  _currentWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Text('WPM: $_wpm'),
            Slider(
              min: 100,
              max: 1000,
              divisions: 18,
              value: _wpm.toDouble(),
              label: '$_wpm',
              onChanged: (value) {
                setState(() {
                  _wpm = value.round();
                });
              },
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: _tokens.isEmpty ? null : _start,
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: isPlaying ? _pause : null,
                  child: const Text('Pause'),
                ),
                ElevatedButton(
                  onPressed: !isPlaying && _isStarted ? _resume : null,
                  child: const Text('Resume'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
