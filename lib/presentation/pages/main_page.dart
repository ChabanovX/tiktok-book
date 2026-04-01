import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/di/service_locator.dart';
import 'package:rsvp_flutter_app/domain/usecases/import_book_file.dart';
import 'package:rsvp_flutter_app/presentation/widgets/new_book_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    final importBookFile = ServiceLocator().get<ImportBookFile>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TikTok-book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              NewBookButton(importBookFile: importBookFile),
            ],
          )
        ),
      ),
    );
  }
}
