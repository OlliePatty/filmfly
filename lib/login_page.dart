import 'package:filmfly/root_page.dart';
import 'package:flutter/material.dart';
import 'package:filmfly/models/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  dynamic username;
  String? email;
  String? password;
  bool isValidUser = true;

  void validUserFunc() {
    setState(() {
      isValidUser = false;
    });
  }

  void updateUsername(dynamic value) {
    setState(() {
      username = value;
    });
  }

  void updateEmail(dynamic value) {
    setState(() {
      email = value;
    });
  }

  void updatePassword(dynamic value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Film Fly'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 46, 41, 78)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
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
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      updateUsername(value);
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_box_rounded,
                          color: Color.fromARGB(255, 217, 3, 104)),
                      hintText: 'What is your username?',
                      labelText: 'Username',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 217, 3, 104))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 217, 3, 104))),
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
                    onChanged: (value) {
                      updateEmail(value);
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.alternate_email,
                          color: Color.fromARGB(255, 217, 3, 104)),
                      hintText: 'What is your email?',
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 217, 3, 104))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 217, 3, 104))),
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
                    onChanged: (value) {
                      updatePassword(value);
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password_rounded,
                          color: Color.fromARGB(255, 217, 3, 104)),
                      hintText: 'What is your password?',
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 217, 3, 104)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 217, 3, 104))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 217, 3, 104))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        getUsers().then((value) {
                          for (var i = 0; i < value.length; i++) {
                            if (username == value[i]['username'] &&
                                email == value[i]['email_address'] &&
                                password == value[i]['password']) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RootPage(userId: [value[i]['user_id']]),
                                  ));
                            } else {
                              validUserFunc();
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 217, 3, 104)),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isValidUser == false)
            const Center(
              child: Text('Uh oh! This account does not exist :(',
                  style: TextStyle(color: Colors.red, fontSize: 20)),
            )
        ],
      ),
    );
  }
}
