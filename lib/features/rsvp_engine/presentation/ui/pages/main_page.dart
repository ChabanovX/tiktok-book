import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/widgets/mock_reading_button.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/widgets/new_book_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RsvpBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TikTok-book'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                NewBookButton(),
                SizedBox(height: 16),
                MockReadingButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
