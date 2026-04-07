import 'dart:async';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';

class RsvpEngine {
  RsvpEngine({
    required this.tokens,
    required this.wpm,
    required this.onTokenChanged,
    this.onCompleted,
    int initialIndex = 0,
  }) : _currentIndex = _normalizeIndex(tokens, initialIndex);
  final List<RsvpBionicToken> tokens;
  final int wpm;
  final void Function(RsvpBionicToken token) onTokenChanged;
  final void Function()? onCompleted;

  late final delay = Duration(milliseconds: (60000 / wpm).round());

  Timer? _timer;
  int _currentIndex;

  int get currentIndex => _currentIndex;
  bool get isPlaying => _timer?.isActive ?? false;

  void start({int? startIndex}) {
    if (tokens.isEmpty) return;

    dispose();

    _currentIndex = _normalizeIndex(tokens, startIndex ?? _currentIndex);
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

  static int _normalizeIndex(List<RsvpBionicToken> tokens, int index) {
    if (tokens.isEmpty) {
      return 0;
    }

    if (index <= 0) {
      return 0;
    }

    if (index >= tokens.length) {
      return tokens.length - 1;
    }

    return index;
  }
}
