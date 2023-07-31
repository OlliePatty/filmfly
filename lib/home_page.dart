import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 500,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              'https://assets-prd.ignimgs.com/2022/07/21/oppenheimer-poster-1658411601593.jpeg',
            ),
          ),
        ),
      ),
    );
  }
}