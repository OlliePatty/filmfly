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
        automaticallyImplyLeading: false,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Wrap(
              children: [
                ElevatedButton(
                  child: Text(genres[index]),
                  onPressed: () {
                    
                  },
                )
              ],
            );
          },
        ),
      ),
      persistentFooterButtons: <Widget>[
        const Text('Next'),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ActorPrefernces(),
              ),
            );
          },
        ),
      ],
    );
  }
}
