part of 'rsvp_bloc.dart';

abstract class RsvpEvent extends Equatable {
  const RsvpEvent();
  
  @override
  List<Object?> get props => [];
}

class LoadTextEvent extends RsvpEvent {
  const LoadTextEvent({required this.text, required this.initialWpm});

  final String text;
  final int initialWpm;
  
  @override
  List<Object?> get props => [text, initialWpm];
}

class StartRsvpEvent extends RsvpEvent {}
class PauseRsvpEvent extends RsvpEvent {}
class ResumeRsvpEvent extends RsvpEvent {}
class NextWordEvent extends RsvpEvent {}
class PreviousWordEvent extends RsvpEvent {}

class ChangeWpmEvent extends RsvpEvent {
  const ChangeWpmEvent(this.newWpm);

  final int newWpm;
  
  @override
  List<Object?> get props => [newWpm];
}

class UpdateCurrentTokenEvent extends RsvpEvent {
  const UpdateCurrentTokenEvent(this.token);
  final RsvpToken token;
  
  @override
  List<Object?> get props => [token];
}
