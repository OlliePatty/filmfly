import 'package:flutter/material.dart';
import 'package:filmfly/signup_page.dart';
import 'login_page.dart';

void main() {
  runApp(const FilmFly());
}

class FilmFly extends StatelessWidget {
  const FilmFly({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Film Fly',
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 41, 78)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 175,
              width: 175,
              child: Image.asset('/Users/oliverpatrick/Project/filmfly/lib/Logo/FilmFlyLogoNoBG.png'),),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 217, 3, 104)),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 217, 3, 104)),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
