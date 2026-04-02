import 'dart:async';
import 'package:rsvp_flutter_app/domain/rsvp_engine/rsvp_token_model.dart';

class RsvpEngine {
  RsvpEngine({
    required this.tokens,
    required this.wpm,
    required this.onTokenChanged,
    this.onCompleted,
  });
  final List<RsvpToken> tokens;
  final int wpm;
  final void Function(RsvpToken token) onTokenChanged;
  final void Function()? onCompleted;

  late final delay = Duration(milliseconds: (60000 / wpm).round());

  Timer? _timer;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  bool get isPlaying => _timer?.isActive ?? false;

  void start({int startIndex = 0}) {
    if (tokens.isEmpty) return;

    dispose();

    _currentIndex = startIndex.clamp(0, tokens.length - 1);
    onTokenChanged(tokens[_currentIndex]);

    _timer = Timer.periodic(delay, (_) {
      _currentIndex++;

      if (_currentIndex >= tokens.length) {
        onCompleted?.call();
        dispose();
        return;
      }

      onTokenChanged(tokens[_currentIndex]);
    });
  }

  void pause() {
    _timer?.cancel();
    _timer = null;
  }

  void resume() {
    if (tokens.isEmpty || _currentIndex >= tokens.length) return;
    start(startIndex: _currentIndex);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }

  void next() {
    if (_currentIndex < tokens.length - 1) {
      _currentIndex++;
      onTokenChanged(tokens[_currentIndex]);
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      onTokenChanged(tokens[_currentIndex]);
    }
  }
}
