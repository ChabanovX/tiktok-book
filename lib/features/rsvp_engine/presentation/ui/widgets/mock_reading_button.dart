import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_tokenizer.dart';

class MockReadingButton extends StatelessWidget {
  const MockReadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          _navigateToMockReadingScreen(context);
        },
        icon: const Icon(Icons.auto_awesome),
        label: const Text('Мок: Открыть чтение (демо)'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  void _navigateToMockReadingScreen(BuildContext context) {
    const demoText = '''
      Это демонстрационный текст для тестирования RSVP чтения.
      Вы можете проверить работу анимации, смены слов и управления скоростью.
      Наслаждайтесь быстрым чтением без движения глаз!
      Попробуйте менять скорость через выпадающий список.
      Нажимайте паузу, если нужно отвлечься.
      И возвращайтесь к чтению в любой момент.
    ''';

    final navigationService = getIt<NavigationService>();
    final tokenizer = RsvpTokenizer();
    final tokens = tokenizer.tokenize(demoText);

    unawaited(
      navigationService.goToReadingScreen(
        tokens: tokens,
        bookTitle: 'Демо-книга',
      ),
    );
  }
}
