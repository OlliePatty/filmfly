import 'package:filmfly/root_page.dart';
import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';

class DirectorPreferences extends StatefulWidget {
  const DirectorPreferences(
      {Key? key,
      this.userId,
      required this.selectedGenres,
      required this.selectedActors})
      : super(key: key);

  final List<int>? userId;
  final List selectedGenres;
  final List selectedActors;

  @override
  State<DirectorPreferences> createState() => _DirectorPreferencesState();
}

class _DirectorPreferencesState extends State<DirectorPreferences> {
  bool loading = true;
  List<dynamic> directors = [];
  List<String> selectedDirectors = [];

  @override
  void initState() {
    super.initState();
    getPreferences('/movies/directors').then((data) {
      setState(() {
        loading = false;
        directors = data['directors'];
      });
    });
  }

  void onPress(director) {
    if (!selectedDirectors.contains("$director")) {
      selectedDirectors.add("$director");
    }
    print(selectedDirectors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                verticalDirection: VerticalDirection.down,
                spacing: 10,
                children: directors.map(
                  (director) {
                    return ElevatedButton(
                      onPressed: () {
                        onPress(director);
                      },
                      child: Text(director),
                    );
                  },
                ).toList(),
              ),
            ),
      persistentFooterButtons: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: TextButton.icon(
            onPressed: () {
              patchUser(widget.userId, widget.selectedGenres,
                  widget.selectedActors, selectedDirectors);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RootPage(userId: widget.userId),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            icon: const Text('Finish'),
            label: const Icon(Icons.arrow_forward),
          ),
        )
      ],
    );
  }
}
