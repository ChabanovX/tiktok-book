import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/theme/build_context_getter.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/bloc/reading_bloc.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FullTextScreen extends StatefulWidget {
  const FullTextScreen({
    required this.tokens,
    super.key,
  });

  final List<RsvpBionicToken> tokens;

  @override
  State<FullTextScreen> createState() => _FullTextScreenState();
}

class _FullTextScreenState extends State<FullTextScreen> {
  final ItemScrollController _scrollController = ItemScrollController();

  final ItemPositionsListener _positionsListener = ItemPositionsListener.create();

  bool _didInitialScroll = false;
  int? _lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReadingBloc>();
    final l10n = context.l10n;
    final appTheme = context.appTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.fullTextTitle,
          style: appTheme.appBarTitleTextStyle,
        ),
      ),
      body: BlocBuilder<ReadingBloc, ReadingState>(
        builder: (context, state) {
          final currentIndex = state.maybeWhen(
            ready: (_, token, _, _, _, _, _) => token.index,
            orElse: () => 0,
          );

          _handleScroll(currentIndex);

          return RawScrollbar(
            thumbVisibility: true,
            thickness: 6,
            radius: const Radius.circular(4),
            child: ScrollablePositionedList.builder(
              itemCount: widget.tokens.length,
              itemScrollController: _scrollController,
              itemPositionsListener: _positionsListener,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final token = widget.tokens[index];

                final isCurrent = index == currentIndex;

                return GestureDetector(
                  onTap: () {
                    bloc.add(
                      ReadingEvent.jumpToIndex(index),
                    );

                    Navigator.pop(context);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isCurrent ? appTheme.primaryColor : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      child: Text(
                        _tokenToText(token),
                        textAlign: TextAlign.center,
                        style: appTheme.mainTextStyle.copyWith(
                          color: isCurrent ? appTheme.backgroundColor : appTheme.mainTextStyle.color,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _handleScroll(int index) {
    if (!_didInitialScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.isAttached) return;

        _scrollController.jumpTo(
          index: index,
          alignment: 0.3,
        );

        _didInitialScroll = true;
        _lastIndex = index;
      });

      return;
    }

    if (_lastIndex == index) return;

    _lastIndex = index;

    if (_scrollController.isAttached) {
      unawaited(
        _scrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: 0.3,
        ),
      );
    }
  }

  String _tokenToText(RsvpBionicToken token) {
    return '${token.boldText}'
        '${token.semiboldText}'
        '${token.regularText}';
  }
}
