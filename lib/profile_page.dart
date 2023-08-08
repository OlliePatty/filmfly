import 'package:filmfly/genre_preferences_page.dart';
import 'package:filmfly/main.dart';
import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {Key? key, this.userId})
      : super(key: key);

      final List<int>? userId;

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
                print(widget.userId);
                patchUser(widget.userId, [], [], []);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenrePreferences(userId: widget.userId),
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
