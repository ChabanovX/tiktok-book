import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => getIt<RsvpBloc>()..add(const RsvpEvent.started()),
      child: BlocBuilder<RsvpBloc, RsvpState>(
        builder: (context, state) {
          final LibraryMainScreenState screenState = switch (state.currentPageState) {
            .initial => .initial,
            .initializing => .initializing,
            _ when state.lastError != null => .importError,
            _ when state.books.isNotEmpty => .nonEmpty,
            _ => .empty,
          };

          final bookWidgets = state.books
              .map(
                (b) => BookItem(
                  key: ValueKey(b),
                  onTap: () => context.read<RsvpBloc>().add(RsvpEvent.toggleSelectBook(book: b)),
                  onDelete: () => context.read<RsvpBloc>().add(RsvpEvent.removeBook(book: b)),
                  isSelected: state.selectedBook == b,
                  title: b.resolveTitle(),
                  author: l10n.bookUnknownAuthor,
                  progress: 0.0,
                ),
              )
              .toList();

          return LibraryMainScreen(
            state: screenState,
            bookItems: bookWidgets,
            onStateActionTap: () => context.read<RsvpBloc>().add(const RsvpEvent.addBook()),
            onAddBookTap: () => context.read<RsvpBloc>().add(const RsvpEvent.addBook()),
            onSettingsTap: () => getIt<NavigationService>().goToSettingsScreen(),
          );
        },
      ),
    );
  }
}
