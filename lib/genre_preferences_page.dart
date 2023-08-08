import 'package:filmfly/actor_preferences_page.dart';
import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class GenrePreferences extends StatefulWidget {
  const GenrePreferences({Key? key, this.userId}) : super(key: key);

  final List<int>? userId;

  @override
  State<GenrePreferences> createState() => _GenrePreferencesState();
}

class _GenrePreferencesState extends State<GenrePreferences> {
  bool loading = true;
  List<dynamic> genres = [];
  List<String> selectedGenres = [];
  List<dynamic> buttonsPressed = [];

  @override
  void initState() {
    super.initState();
    getPreferences('/movies/genres').then((data) {
      setState(() {
        loading = false;
        genres = data['genres'];
      });
    });
  }

  void onPress(genre) {
    if (!selectedGenres.contains("$genre")) {
      selectedGenres.add("$genre");
    }
    print(selectedGenres);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
        automaticallyImplyLeading: false,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Choose your favourite genres:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  spacing: 10,
                  children: genres.map(
                    (genre) {
                      return ElevatedButton(
                        onPressed: buttonsPressed.contains(genre)
                            ? null
                            : () {
                                onPress(genre);
                                setState(() {
                                  buttonsPressed.add(genre);
                                });
                              },
                        child: Text(genre),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
      persistentFooterButtons: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: TextButton.icon(
            onPressed: () {
              print(widget.userId);
              onPress(genres);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActorPrefernces(
                      userId: widget.userId, selectedGenres: selectedGenres),
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
