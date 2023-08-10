import 'package:flutter/material.dart';
import 'package:filmfly/genre_preferences_page.dart';
import 'package:filmfly/models/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<int> userId = [];

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Film Fly'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 46, 41, 78)),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                    '/Users/oliverpatrick/Project/filmfly/lib/Logo/FilmFlyLogoNoBG.png'),
              ),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                cursorColor: const Color.fromARGB(255, 217, 3, 104),
                decoration: const InputDecoration(
                  icon: Icon(Icons.tag_faces,
                      color: Color.fromARGB(255, 217, 3, 104)),
                  hintText: 'What is your name?',
                  labelText: 'Name',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                ),
              ),
              TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                cursorColor: const Color.fromARGB(255, 217, 3, 104),
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_box_rounded,
                      color: Color.fromARGB(255, 217, 3, 104)),
                  hintText: 'What is your username?',
                  labelText: 'Username',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                cursorColor: const Color.fromARGB(255, 217, 3, 104),
                decoration: const InputDecoration(
                  icon: Icon(Icons.alternate_email,
                      color: Color.fromARGB(255, 217, 3, 104)),
                  hintText: 'What is your email?',
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                ),
              ),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Please enter a password of at least 5 characters';
                  }
                  return null;
                },
                cursorColor: const Color.fromARGB(255, 217, 3, 104),
                decoration: const InputDecoration(
                  icon: Icon(Icons.password_rounded,
                      color: Color.fromARGB(255, 217, 3, 104)),
                  hintText: 'What is your password?',
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 217, 3, 104))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      postUser(nameController.text, usernameController.text,
                              emailController.text, passwordController.text)
                          .then((user) {
                        userId.add(user[0]['user_id']);
                        print('Sign up page: $userId');
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Creating your account...'),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GenrePreferences(userId: userId),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 217, 3, 104)),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
