import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/data/datasources/file_picker_datasource.dart';
import 'package:rsvp_flutter_app/data/repositories/file_repository_impl.dart';
import 'package:rsvp_flutter_app/data/services/file_loader_service.dart';
import 'package:rsvp_flutter_app/di/service_locator.dart';
import 'package:rsvp_flutter_app/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/domain/usecases/import_book_file.dart';
import 'package:rsvp_flutter_app/presentation/pages/main_page.dart';


void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

void setupServiceLocator() {
  final locator = ServiceLocator()
  
  ..register<FileLoaderService>(FileLoaderService())
  ..register<FilePickerDataSource>(FilePickerDataSource());

  locator..register<FileRepository>(
    FileRepositoryImpl(
      locator.get<FileLoaderService>(),
    ),
  )
  ..register<ImportBookFile>(
    ImportBookFile(
      locator.get<FileRepository>(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
