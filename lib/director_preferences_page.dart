import 'package:filmfly/root_page.dart';
import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';

class DirectorPreferences extends StatefulWidget {
  const DirectorPreferences({super.key});

  @override
  State<DirectorPreferences> createState() => _DirectorPreferencesState();
}

class _DirectorPreferencesState extends State<DirectorPreferences> {
  var isLoaded = false;
  List<dynamic> directors = [];

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
          itemCount: directors.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              child: Text(directors[index]),
              onPressed: () {
                
              },
            );
          },
        ),
      ),
      persistentFooterButtons: <Widget>[
        const Text('Finish'),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RootPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}