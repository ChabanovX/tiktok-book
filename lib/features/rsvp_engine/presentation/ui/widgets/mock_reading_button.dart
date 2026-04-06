import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_tokenizer.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

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
        label: Text(context.l10n.mockReadingButtonLabel),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  void _navigateToMockReadingScreen(BuildContext context) {
    final navigationService = getIt<NavigationService>();
    final tokenizer = RsvpTokenizer();
    final tokens = tokenizer.tokenize(context.l10n.mockReadingDemoText);

    unawaited(
      navigationService.goToReadingScreen(
        tokens: tokens,
        bookTitle: context.l10n.mockReadingBookTitle,
      ),
    );
  }
}
