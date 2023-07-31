import 'package:flutter/material.dart';

class Preferences extends StatelessWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
        automaticallyImplyLeading: false,
      ),
      body: const Column(
        children: [
          Center(
            child: Text(
              'Choose your preferences',
            ),
          ),
        ],
      ),
    );
  }
}
