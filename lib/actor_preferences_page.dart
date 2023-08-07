import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';
import 'package:filmfly/director_preferences_page.dart';

class ActorPrefernces extends StatefulWidget {
  const ActorPrefernces(
      {Key? key, this.userId, required this.selectedGenres})
      : super(key: key);

  final int? userId;
  final List selectedGenres;

  @override
  State<ActorPrefernces> createState() => _ActorPreferncesState();
}

class _ActorPreferncesState extends State<ActorPrefernces> {
  var isLoaded = false;
  List<dynamic> actors = [];
  List<String> selectedActors = [];

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
    if (!selectedActors.contains("'$actor'")) {
      selectedActors.add("'$actor'");
    }
    print('$selectedActors');
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
        child: SingleChildScrollView(
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
      ),
      persistentFooterButtons: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: TextButton.icon(
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  

                  builder: (context) => DirectorPreferences(
                    
                      userId: widget.userId,
                      selectedGenres: widget.selectedGenres,
                      selectedActors: selectedActors),
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
