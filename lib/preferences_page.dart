import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Preferences extends HookWidget {
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
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
