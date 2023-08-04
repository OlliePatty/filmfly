import 'package:http/http.dart' as http;
import 'dart:convert';

Future getData(endpoint) async {
  final url = Uri.parse('https://film-fly.onrender.com/api$endpoint');
  final response = await http.get(url);
  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return data;
  } else {
    throw Exception('Failed to load');
  }
}

Future postUser(String name, String username, String email, String password) async {
  final url = Uri.parse('https://film-fly.onrender.com/api/users');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "name": name,
      "username": username,
      "email_address": email,
      "password": password
    }),
  );
  final data = jsonDecode(response.body);
  if (response.statusCode == 201) {
    return data;
  } else {
    throw Exception('Failed to load');
  }
}


Future patchUser(userId, genres, actors, directors) async {
  print(userId);
  print(genres);
  print(actors);
  print(directors);

  final url = Uri.parse('https://film-fly.onrender.com/api/user/$userId');
  Map<String, dynamic> preferences = {
    "genre_scores": "{'romance' : 5, 'comedy' : 5, 'horror' : 5}",
    "genre_pref": "{ pref : genres}",
    "actor_pref": "{ pref : ['Brad Pitt', 'Idris Elba']}",
    "actor_scores": "{'Brad Pitt' : 5, 'Idris Elba' : 5}",
    "director_pref": "{ pref : ['Christopher Nolan']}",
    "director_scores": "{'Christopher Nolan' : 5}",
    "liked_movies": "{liked : []}",
    "disliked_movies": "{ disliked : []}",
    "watched_recently": "{ history : []}"
  };

  final response = await http.put(url, body: preferences);
  print(response.statusCode);
  print(response.body);
}
