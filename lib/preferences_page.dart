import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  var isLoaded = false;
  List<dynamic> genres = [];

  @override
  void initState() {
    super.initState();
    getData('/movies/genres').then((data) {
      setState(() {
        isLoaded = true;
        genres = data['genres'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(genres[index]),
            );
          },
        ),
      ),
    );
  }
}
