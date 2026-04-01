import 'dart:async';
import 'package:rsvp_flutter_app/rsvpTokenModel.dart';

class RsvpEngine {
  final List<RsvpToken> tokens;
  final int wpm;
  final void Function(RsvpToken token) onTokenChanged;
  final void Function()? onCompleted;

  Timer? _timer;
  int _currentIndex = 0;

  RsvpEngine({
    required this.tokens,
    required this.wpm,
    required this.onTokenChanged,
    this.onCompleted,
  });

  int get currentIndex => _currentIndex;
  bool get isPlaying => _timer?.isActive ?? false;

  void start({int startIndex = 0}) {
    if (tokens.isEmpty) return;

    stop();

    _currentIndex = startIndex.clamp(0, tokens.length - 1);
    onTokenChanged(tokens[_currentIndex]);

    final delay = Duration(milliseconds: (60000 / wpm).round());

    _timer = Timer.periodic(delay, (timer) {
      _currentIndex++;

      if (_currentIndex >= tokens.length) {
        stop();
        onCompleted?.call();
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

  void stop() {
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
