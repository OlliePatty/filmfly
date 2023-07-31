import 'package:flutter/material.dart';
import 'root_page.dart';

void main() {
  runApp(const FilmFly());
}

class FilmFly extends StatelessWidget {
  const FilmFly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RootPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
