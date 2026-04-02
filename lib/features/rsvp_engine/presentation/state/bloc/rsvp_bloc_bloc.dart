import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rsvp_bloc_event.dart';
part 'rsvp_bloc_state.dart';
part 'rsvp_bloc_bloc.freezed.dart';

class RsvpBlocBloc extends Bloc<RsvpBlocEvent, RsvpBlocState> {
  RsvpBlocBloc() : super(_Initial()) {
    on<RsvpBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
