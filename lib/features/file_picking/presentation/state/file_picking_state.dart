part of 'file_picking_bloc.dart';

abstract class FilePickingState extends Equatable {
  const FilePickingState();
  
  @override
  List<Object?> get props => [];
}

class FilePickingInitial extends FilePickingState {}

class FilePickingLoading extends FilePickingState {}

class FilePickingSuccess extends FilePickingState {
  
  const FilePickingSuccess();
  
}

class FilePickingError extends FilePickingState {
  const FilePickingError(this.message);

  final String message;
  
  @override
  List<Object?> get props => [message];
}
