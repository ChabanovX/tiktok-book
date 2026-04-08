import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/bloc/reading_bloc.dart';

class FullTextArguments {
  FullTextArguments({
    required this.tokens,
    required this.readingBloc,
  });

  final List<RsvpToken> tokens;
  final ReadingBloc readingBloc;
}
