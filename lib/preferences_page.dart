import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Article> fetchArticle() async {
  final response = await http
      .get(Uri.parse('https://ollies-nc-news.onrender.com/api/articles'));

  if (response.statusCode == 200) {
    var articlesData = jsonDecode(response.body)['articles'][0];
    if (kDebugMode) {
      print(articlesData);
    }
    return Article.fromJson(articlesData);
  } else {
    throw Exception('Failed to load album');
  }
}

class Article {
  final String title;
  final String topic;

  const Article({required this.title, required this.topic});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(title: json['title'], topic: json['topic']);
  }
}

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  late Future<Article> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Fly'),
      ),
      body: Center(
        child: FutureBuilder<Article>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
