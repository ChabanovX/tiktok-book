import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_tokenizer.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class BottomSelectedbookWindow extends StatelessWidget {
  const BottomSelectedbookWindow({required this.selectedBook, super.key});

  final BookMetaModel selectedBook;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final l10n = context.l10n;
    final resolvedTitle = selectedBook.resolveTitle().trim();
    final title = resolvedTitle.isEmpty ? l10n.bookUnknownTitle : resolvedTitle;
    final wordCount = selectedBook.tokens.length;
    final fileExtension = selectedBook.bookFile.fileExtension.toUpperCase();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: appTheme.backgroundColor2,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: appTheme.secondaryColor.withValues(alpha: 0.18),
              ),
              boxShadow: [
                BoxShadow(
                  color: appTheme.primaryColor.withValues(alpha: 0.12),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
                BoxShadow(
                  color: appTheme.stateCardShadowColor,
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 16, 14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.selectedBookTitle,
                          style: appTheme.subTextStyle.copyWith(
                            color: appTheme.primaryColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTheme.mainTextStyle.copyWith(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _InfoChip(
                              label: _wordCountLabel(context, wordCount),
                              color: appTheme.primaryColor,
                            ),
                            _InfoChip(
                              label: fileExtension,
                              color: appTheme.secondaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: appTheme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: CupertinoButton(
                      padding: .zero,
                      child: Text(
                        l10n.selectedBookRead,
                        style: appTheme.mainTextStyle.copyWith(
                          color: appTheme.primaryColor,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                      onPressed: () {
                        final navigationService = getIt<NavigationService>();
                        final bionicTokens = getIt<RsvpTokenizer>().tokenizeBionicFromDomain(selectedBook.tokens);
                        unawaited(
                          navigationService.goToReadingScreen(
                            tokens: bionicTokens,
                            book: selectedBook,
                            bookTitle: title,
                            rsvpBloc: context.read<RsvpBloc>(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _wordCountLabel(BuildContext context, int count) {
    final l10n = context.l10n;
    return l10n.bookWordCount(count);
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: appTheme.subTextStyle.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
