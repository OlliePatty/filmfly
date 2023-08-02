import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';
import 'package:filmfly/director_preferences_page.dart';

class ActorPrefernces extends StatefulWidget {
  const ActorPrefernces({super.key});

  @override
  State<ActorPrefernces> createState() => _ActorPreferncesState();
}

class _ActorPreferncesState extends State<ActorPrefernces> {
  var isLoaded = false;
  List<dynamic> actors = [];

  @override
  void initState() {
    super.initState();
    getData('/movies/actors').then((data) {
      setState(() {
        isLoaded = true;
        actors = data['actors'];
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
          itemCount: actors.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(actors[index]),
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
                builder: (context) => const DirectorPreferences(),
              ),
            );
          },
        ),
      ],
    );
  }
}
