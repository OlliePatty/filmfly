import 'package:filmfly/root_page.dart';
import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';

class DirectorPreferences extends StatefulWidget {
  const DirectorPreferences(
      {Key? key, required this.selectedGenres, required this.selectedActors})
      : super(key: key);

  final List selectedGenres;
  final List selectedActors;

  @override
  State<DirectorPreferences> createState() => _DirectorPreferencesState();
}

class _DirectorPreferencesState extends State<DirectorPreferences> {
  var isLoaded = false;
  List<dynamic> directors = [];
  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    getData('/movies/directors').then((data) {
      setState(() {
        isLoaded = true;
        directors = data['directors'];
      });
    });
  }

  void onPress(director) {
    selected.add(director);
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
        child: SingleChildScrollView(
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
      ),
      persistentFooterButtons: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RootPage(),
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
