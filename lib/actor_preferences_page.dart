

import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';
import 'package:filmfly/director_preferences_page.dart';

class ActorPrefernces extends StatefulWidget {
  const ActorPrefernces({Key? key, this.userId, required this.selectedGenres})
      : super(key: key);

  final List<int>? userId;
  final List selectedGenres;

  @override
  State<ActorPrefernces> createState() => _ActorPreferncesState();
}

class _ActorPreferncesState extends State<ActorPrefernces> {
  bool loading = true;
  List<dynamic> actors = [];
  List<String> selectedActors = [];
  List<dynamic> buttonsPressed = [];

  @override
  void initState() {
    super.initState();
    getPreferences('/movies/actors').then((data) {
      setState(() {
        loading = false;
        actors = data['actors'];
      });
    });
  }

  void onPress(actor) {
    if (!selectedActors.contains("$actor")) {
      selectedActors.add("$actor");
    }
    print(selectedActors);
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
              child: Column(
                children: [
        
        AppBar(
         automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              onChanged: (value) {
                
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Choose your favourite actors:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    spacing: 10,
                    children: actors.map(
                      (actor) {
                        return ElevatedButton(
                          onPressed: buttonsPressed.contains(actor)
                              ? null
                              : () {
                                  onPress(actor);
                                  setState(() {
                                    buttonsPressed.add(actor);
                                  });
                                },
                          child: Text(actor),
                        );
                      },
                    ).toList(),
                  ),
                ],
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
