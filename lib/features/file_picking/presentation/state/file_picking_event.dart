part of 'file_picking_bloc.dart';

abstract class FilePickingEvent extends Equatable {
  const FilePickingEvent();
  
  @override
  List<Object?> get props => [];
}

class PickBookFileEvent extends FilePickingEvent {}

class LoadDemoBookEvent extends FilePickingEvent {}

class ResetFilePickingEvent extends FilePickingEvent {}
