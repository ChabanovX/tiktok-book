import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/widgets/new_book_button.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RsvpBloc>(),
      child: BlocBuilder<RsvpBloc, RsvpState>(
        builder: (context, state) {
          final LibraryMainScreenState screenState = switch (state) {
            _ when state.lastError != null => .importError,
            _ when state.books.isNotEmpty => .nonEmpty,
            _ => .empty,
          };

          final bookWidgets = state.books
              .map(
                (b) => BookItem(
                  title: b.name ?? 'Unknown',
                  author: 'Unknown',
                  progress: 0.0,
                ),
              )
              .toList();

          return LibraryMainScreen(
            state: screenState,
            bookItems: bookWidgets,
            onStateActionTap: () => context.read<RsvpBloc>().add(const RsvpEvent.addBook()),
            onAddBookTap: () => context.read<RsvpBloc>().add(const RsvpEvent.addBook()),
          );
        },
      ),
    );
  }
}

class OldMainPage extends StatelessWidget {
  const OldMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TikTok-book'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [NewBookButton()],
          ),
        ),
      ),
    );
  }
}
