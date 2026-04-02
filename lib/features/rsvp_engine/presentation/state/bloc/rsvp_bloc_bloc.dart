import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';

part 'rsvp_bloc_event.dart';
part 'rsvp_bloc_state.dart';
part 'rsvp_bloc_bloc.freezed.dart';

class RsvpBlocBloc extends Bloc<RsvpBlocEvent, RsvpBlocState> {
  RsvpBlocBloc() : super(const _RsvpBlocState()) {
    on<_Started>((event, emit) {
      
    });
    on<_AddBook>((event, emit) {});
    on<_StartAnimation>((event, emit) {});
  }
}
