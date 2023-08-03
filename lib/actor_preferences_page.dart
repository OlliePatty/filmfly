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
  List<String> selected = [];

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

    void onPress(actor) {
    selected.add(actor);
    debugPrint('$selected');
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
        child: Wrap(
          alignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          spacing: 10,
          children: actors.map(
            (actor) {
              return ElevatedButton(
                onPressed: () {
                  onPress(actor);
                },
                child: Text(actor),
              );
            },
          ).toList(),
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
