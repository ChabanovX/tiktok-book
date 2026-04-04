import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/usecases/import_book_file.dart';

part 'file_picking_event.dart';
part 'file_picking_state.dart';

@injectable
class FilePickingBloc extends Bloc<FilePickingEvent, FilePickingState> {
  FilePickingBloc({
    required this.importBookFile,
  }) : super(FilePickingInitial()) {
    
    on<LoadDemoBookEvent>(_onLoadDemoBook);
    
    on<ResetFilePickingEvent>(_onReset);
  }

  final ImportBookFile importBookFile;
  
  Future<void> _onLoadDemoBook(
    LoadDemoBookEvent event,
    Emitter<FilePickingState> emit,
  ) async {
    emit(FilePickingLoading());
    
    await Future.delayed(const Duration(milliseconds: 500));
    
    emit(const FilePickingSuccess());
  }
  
  void _onReset(
    ResetFilePickingEvent event,
    Emitter<FilePickingState> emit,
  ) {
    emit(FilePickingInitial());
  }
}
