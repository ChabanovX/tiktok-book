import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/presentation/widgets/new_book_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TikTok-book'),
      ),
      body: const Center(
        child: Column(
          children: [
            NewBookButton(),
          ],
        )
      ),
    );
  }
}
