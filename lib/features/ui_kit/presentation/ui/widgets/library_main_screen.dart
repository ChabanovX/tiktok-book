import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/presentation/ui/widgets/primary_button.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/widgets/new_book_button.dart';

enum LibraryMainScreenState {
  nonEmpty,
  empty,
  importError,
}

class LibraryMainScreen extends StatelessWidget {
  const LibraryMainScreen({
    required this.state,
    this.bookItems = const [],
    this.onAddBookTap,
    this.onStateActionTap,
    this.appBarTitle = 'Book Fast Track TT HZ',
    this.collectionTitle = 'Personal Collection',
    this.addBookLabel = 'ADD NEW BOOK',
    this.emptyTitle = 'Your library is empty',
    this.emptyDescription = 'Add your first book to\nstart fast reading!',
    this.emptyButtonLabel = 'Upload a book',
    this.importErrorTitle = 'Import error',
    this.importErrorDescription = 'Something went wrong\nduring uploading',
    this.importErrorButtonLabel = 'Try again',
    super.key,
  });

  final LibraryMainScreenState state;
  final List<Widget> bookItems;
  final VoidCallback? onAddBookTap;
  final VoidCallback? onStateActionTap;
  final String appBarTitle;
  final String collectionTitle;
  final String addBookLabel;
  final String emptyTitle;
  final String emptyDescription;
  final String emptyButtonLabel;
  final String importErrorTitle;
  final String importErrorDescription;
  final String importErrorButtonLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final appBarTextStyle = (appTheme?.appBarTitleTextStyle ?? theme.textTheme.displayMedium ?? const TextStyle())
        .copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color:
              appTheme?.appBarTitleTextStyle.color ??
              theme.textTheme.displayMedium?.color ??
              theme.colorScheme.onSurface,
        );
    final titleStyle = (appTheme?.titleTextStyle ?? theme.textTheme.displayLarge ?? const TextStyle()).copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.15,
    );

    return Scaffold(
      backgroundColor: appTheme?.backgroundColor2 ?? theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appTheme?.backgroundColor2 ?? theme.cardColor,
                border: Border(
                  bottom: BorderSide(
                    color: appTheme?.dividerColorMuted ?? theme.dividerColor,
                  ),
                ),
              ),
              child: Text(
                appBarTitle,
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
                      collectionTitle,
                      style: titleStyle,
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: appTheme?.secondaryColor ?? theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(999),
                      ),
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
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    switch (state) {
      case LibraryMainScreenState.nonEmpty:
        return ListView(
          children: [
            NewBookButton(
              label: addBookLabel,
              onTap: onAddBookTap,
            ),
            const SizedBox(height: 18),
            ..._buildSeparatedItems(bookItems),
          ],
        );
      case LibraryMainScreenState.empty:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 336),
            child: _StateContent(
              illustration: const _EmptyLibraryIllustration(),
              title: emptyTitle,
              description: emptyDescription,
              buttonLabel: emptyButtonLabel,
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
              title: importErrorTitle,
              description: importErrorDescription,
              buttonLabel: importErrorButtonLabel,
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
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final titleStyle = (appTheme?.titleTextStyle ?? theme.textTheme.displayLarge ?? const TextStyle()).copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.15,
    );
    final descriptionStyle = (appTheme?.subTextStyle ?? theme.textTheme.bodyMedium ?? const TextStyle()).copyWith(
      fontSize: 16,
      height: 1.35,
      color:
          appTheme?.stateDescriptionColor ??
          appTheme?.mainTextStyle.color?.withValues(alpha: 0.82) ??
          theme.textTheme.bodyMedium?.color,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        illustration,
        const SizedBox(height: 28),
        Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          style: descriptionStyle,
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
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();
    final cardColor = appTheme?.backgroundColor2 ?? Colors.white;
    final iconColor = appTheme?.secondaryColor ?? theme.colorScheme.secondary;
    final shadowColor = appTheme?.stateCardShadowColor ?? theme.shadowColor;
    final accentBackgroundColor = appTheme?.emptyStateAccentBackgroundColor ?? theme.colorScheme.errorContainer;
    final accentColor = appTheme?.emptyStateAccentColor ?? theme.colorScheme.error;

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
    final appTheme = theme.extension<AppTheme>();
    final cardColor = appTheme?.backgroundColor2 ?? Colors.white;
    final shadowColor = appTheme?.stateCardShadowColor ?? theme.shadowColor;
    final accentColor = appTheme?.errorStateAccentColor ?? theme.colorScheme.error;

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
              color: appTheme?.secondaryColor ?? theme.colorScheme.secondary,
              shape: BoxShape.circle,
              border: Border.all(
                color: cardColor,
                width: 4,
              ),
            ),
            child: const Icon(
              Icons.info_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
