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
                  key: ValueKey(b.documentId),
                  onTap: () => context.read<RsvpBloc>().add(RsvpEvent.toggleSelectBook(book: b)),
                  onDelete: () => context.read<RsvpBloc>().add(RsvpEvent.removeBook(book: b)),
                  onEditSubmit: (newName, newAuthor) {
                    context.read<RsvpBloc>().add(
                      RsvpEvent.updateBookInfo(
                        documentId: b.documentId,
                        newName: newName,
                        newAuthor: newAuthor,
                      ),
                    );
                  },
                  isSelected: state.selectedBook?.documentId == b.documentId,
                  editInitialTitle: b.name ?? b.resolveTitle(),
                  editInitialAuthor: b.author,
                  title: b.resolveTitle(),
                  author: b.resolveAuthor() ?? l10n.bookUnknownAuthor,
                  progress: b.resolveProgress(),
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
