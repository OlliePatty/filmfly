import 'package:filmfly/genre_preferences_page.dart';
import 'package:filmfly/main.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Reset Preferences'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenrePreferences(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Log Out'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilmFly(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
