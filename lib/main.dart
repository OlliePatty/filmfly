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
    return MaterialApp(
      title: 'Film Fly',
      home: const FirstPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
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
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
