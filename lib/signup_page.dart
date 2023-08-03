import 'package:flutter/material.dart';
import 'package:filmfly/genre_preferences_page.dart';
import 'package:filmfly/models/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> selected = [];

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: myController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What is your name?',
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What is your username?',
                  labelText: 'Username',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What is your email?',
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Please enter a password of at least 5 characters';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What is your passowrd?',
                  labelText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      postUser(myController.text);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Creating your account...')));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GenrePreferences(),
                        ),
                      );
                    }
                  },
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
