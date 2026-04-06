import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/constants.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/widgets/new_book_button.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/bottom_selectedbook_window.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/primary_button.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

enum LibraryMainScreenState {
  nonEmpty,
  empty,
  importError,
}

const Duration _bookSelectionAnimationDuration = Constants.basicAnimationDuration;
const Curve _bookSelectionAnimationCurve = Constants.basicAnimationCurve;

class LibraryMainScreen extends StatelessWidget {
  const LibraryMainScreen({
    required this.state,
    this.bookItems = const [],
    this.onAddBookTap,
    this.onStateActionTap,
    this.appBarTitle,
    this.collectionTitle,
    this.addBookLabel,
    this.emptyTitle,
    this.emptyDescription,
    this.emptyButtonLabel,
    this.importErrorTitle,
    this.importErrorDescription,
    this.importErrorButtonLabel,
    super.key,
  });

  final LibraryMainScreenState state;
  final List<Widget> bookItems;
  final VoidCallback? onAddBookTap;
  final VoidCallback? onStateActionTap;
  final String? appBarTitle;
  final String? collectionTitle;
  final String? addBookLabel;
  final String? emptyTitle;
  final String? emptyDescription;
  final String? emptyButtonLabel;
  final String? importErrorTitle;
  final String? importErrorDescription;
  final String? importErrorButtonLabel;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final l10n = context.l10n;
    final appBarTextStyle = appTheme.appBarTitleTextStyle;
    final hasRsvpBloc = _hasRsvpBloc(context);
    final resolvedAppBarTitle = appBarTitle ?? l10n.appTitle;
    final resolvedCollectionTitle = collectionTitle ?? l10n.libraryCollectionTitle;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor2,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 68,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appTheme.backgroundColor2,
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.dividerColorMuted,
                      ),
                    ),
                  ),
                  child: Text(
                    resolvedAppBarTitle,
                    style: appBarTextStyle,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resolvedCollectionTitle,
                          style: appTheme.titleTextStyle,
                        ),
                        const SizedBox(height: 18),
                        Expanded(
                          child: _buildBody(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (hasRsvpBloc)
              BlocBuilder<RsvpBloc, RsvpState>(
                buildWhen: (previous, current) => previous.selectedBook != current.selectedBook,
                builder: (context, state) {
                  final selectedBook = state.selectedBook;
                  return Positioned(
                    left: 0,
                    right: 0,
                    bottom: 32,
                    child: AnimatedSwitcher(
                      duration: _bookSelectionAnimationDuration,
                      switchInCurve: _bookSelectionAnimationCurve,
                      switchOutCurve: _bookSelectionAnimationCurve,
                      transitionBuilder: (child, animation) {
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: _bookSelectionAnimationCurve,
                        );

                        return FadeTransition(
                          opacity: curvedAnimation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.08),
                              end: Offset.zero,
                            ).animate(curvedAnimation),
                            child: child,
                          ),
                        );
                      },
                      child: selectedBook == null
                          ? const SizedBox(
                              key: ValueKey('bottom-selected-book-empty'),
                            )
                          : BottomSelectedbookWindow(
                              key: ValueKey(selectedBook.bookFile.name),
                              selectedBook: selectedBook,
                            ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return AnimatedSwitcher(
      duration: _bookSelectionAnimationDuration,
      switchInCurve: _bookSelectionAnimationCurve,
      switchOutCurve: _bookSelectionAnimationCurve,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          fit: StackFit.expand,
          children: [
            ...previousChildren,
            ?currentChild,
          ],
        );
      },
      transitionBuilder: (child, animation) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: _bookSelectionAnimationCurve,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.04),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          ),
        );
      },
      child: KeyedSubtree(
        key: ValueKey(state),
        child: _buildBodyContent(context),
      ),
    );
  }

  bool _hasRsvpBloc(BuildContext context) {
    return context.findAncestorWidgetOfExactType<BlocProvider<RsvpBloc>>() != null;
  }

  Widget _buildBodyContent(BuildContext context) {
    final l10n = context.l10n;
    final resolvedAddBookLabel = addBookLabel ?? l10n.libraryAddBookCta;
    final resolvedEmptyTitle = emptyTitle ?? l10n.libraryEmptyTitle;
    final resolvedEmptyDescription = emptyDescription ?? l10n.libraryEmptyDescription;
    final resolvedEmptyButtonLabel = emptyButtonLabel ?? l10n.libraryEmptyButton;
    final resolvedImportErrorTitle = importErrorTitle ?? l10n.libraryImportErrorTitle;
    final resolvedImportErrorDescription = importErrorDescription ?? l10n.libraryImportErrorDescription;
    final resolvedImportErrorButtonLabel = importErrorButtonLabel ?? l10n.libraryImportErrorButton;

    switch (state) {
      case LibraryMainScreenState.nonEmpty:
        return Column(
          children: [
            NewBookButton(
              label: resolvedAddBookLabel,
              onTap: onAddBookTap,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                children: [
                  ..._buildSeparatedItems(bookItems),
                  // Also add sizedBox for valid intersection with bottom_selectedbook_window.
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ],
        );
      case LibraryMainScreenState.empty:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 336),
            child: _StateContent(
              illustration: const _EmptyLibraryIllustration(),
              title: resolvedEmptyTitle,
              description: resolvedEmptyDescription,
              buttonLabel: resolvedEmptyButtonLabel,
              onButtonTap: onStateActionTap,
            ),
          ),
        );
      case LibraryMainScreenState.importError:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 336),
            child: _StateContent(
              illustration: const _ImportErrorIllustration(),
              title: resolvedImportErrorTitle,
              description: resolvedImportErrorDescription,
              buttonLabel: resolvedImportErrorButtonLabel,
              onButtonTap: onStateActionTap,
            ),
          ),
        );
    }
  }

  List<Widget> _buildSeparatedItems(List<Widget> items) {
    final result = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i < items.length - 1) {
        result.add(const SizedBox(height: 18));
      }
    }

    return result;
  }
}

class _StateContent extends StatelessWidget {
  const _StateContent({
    required this.illustration,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onButtonTap,
  });

  final Widget illustration;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        illustration,
        const SizedBox(height: 28),
        Text(
          title,
          textAlign: TextAlign.center,
          style: appTheme.titleTextStyle,
        ),
        const SizedBox(height: 12),
        Opacity(
          opacity: 0.82,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: appTheme.subTextStyle,
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: buttonLabel,
            onTap: onButtonTap ?? () {},
          ),
        ),
      ],
    );
  }
}

class _EmptyLibraryIllustration extends StatelessWidget {
  const _EmptyLibraryIllustration();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final cardColor = appTheme.backgroundColor2;
    final iconColor = appTheme.secondaryColor;
    final shadowColor = appTheme.stateCardShadowColor;
    final accentBackgroundColor = appTheme.emptyStateAccentBackgroundColor;
    final accentColor = appTheme.emptyStateAccentColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 104,
          width: 104,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.menu_book_rounded,
            color: iconColor,
            size: 52,
          ),
        ),
        Positioned(
          top: -14,
          right: -14,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: accentBackgroundColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.bolt_rounded,
              color: accentColor,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class _ImportErrorIllustration extends StatelessWidget {
  const _ImportErrorIllustration();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = context.appTheme;
    final cardColor = appTheme.backgroundColor2;
    final shadowColor = appTheme.stateCardShadowColor;
    final accentColor = appTheme.errorStateAccentColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 124,
          width: 124,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.description_outlined,
                  color: accentColor,
                  size: 54,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -4,
          bottom: -6,
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: appTheme.secondaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: cardColor,
                width: 4,
              ),
            ),
            child: Icon(
              Icons.info_rounded,
              color: theme.colorScheme.onSecondary,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
