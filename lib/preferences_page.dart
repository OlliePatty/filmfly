import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {

  var article = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var url =
                Uri.parse('https://ollies-nc-news.onrender.com/api/articles');
            var response = await http.get(url);
            var articlesData = jsonDecode(response.body);
            if(kDebugMode){
            print(articlesData['articles'][0]['title']);
            setState(() {
              article = articlesData['articles'][0]['title'];
            });
            }
          },
          child: Text(article),
        ),
      ),
    );
  }
}
