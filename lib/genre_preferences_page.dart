import 'package:filmfly/actor_preferences_page.dart';
import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class GenrePreferences extends StatefulWidget {
  const GenrePreferences({super.key});

  @override
  State<GenrePreferences> createState() => _GenrePreferencesState();
}

class _GenrePreferencesState extends State<GenrePreferences> {
  var isLoaded = false;
  List<dynamic> genres = [];
  List<String> selectedGenres = [];

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

  void onPress(genre) {
    selectedGenres.add(genre);
    debugPrint('$selectedGenres');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
        automaticallyImplyLeading: false,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            verticalDirection: VerticalDirection.down,
            spacing: 10,
            children: genres.map(
              (genres) {
                return ElevatedButton(
                  onPressed: () {
                    onPress(genres);
                  },
                  child: Text(genres),
                );
              },
            ).toList(),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActorPrefernces(selectedGenres: selectedGenres),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            icon: const Text('Next'),
            label: const Icon(Icons.arrow_forward),
          ),
        )
      ],
    );
  }
}
