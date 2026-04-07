import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';

class ReadingArguments {
  ReadingArguments({
    required this.tokens,
    required this.book,
    required this.bookTitle,
    required this.rsvpBloc,
  });

  final List<RsvpBionicToken> tokens;
  final BookMetaModel book;
  final String bookTitle;
  final RsvpBloc rsvpBloc;
}
