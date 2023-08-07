import 'package:http/http.dart' as http;
import 'dart:convert';

Future getPreferences(endpoint) async {
  final url = Uri.parse('https://film-fly.onrender.com/api$endpoint');
  final response = await http.get(url);
  final preferences = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return preferences;
  } else {
    throw Exception('Failed to load');
  }
}

Future postUser(String name, String username, String email, String password) async {
  final url = Uri.parse('https://film-fly.onrender.com/api/users');
  final headers = {'Content-Type': 'application/json; charset=UTF-8'};
  final data = {
    "name": name,
    "username": username,
    "email_address": email,
    "password": password
  };
  final response =
      await http.post(url, headers: headers, body: jsonEncode(data));
  final user = jsonDecode(response.body);
  
  if (response.statusCode == 201) {
    return user;
  } else {
    throw Exception('Failed to load');
  }
}


Future patchUser(userId, genres, actors, directors) async {
  int userid = userId[0];

  final url = Uri.parse('https://film-fly.onrender.com/api/users/$userid');
  final headers = {'Content-Type': 'application/json'};
  final data = {"genres": genres, "actors": actors, "directors": directors};
  final response =
      await http.patch(url, headers: headers, body: jsonEncode(data));

  if (response.statusCode == 201) {
    print('PATCH request successful');
    print(response.body);
  } else {
    print('PATCH request failed');
    throw Exception('Failed PATCH request');
  }
}

Future getSearchResults(searchQuery) async {
  final url = Uri.parse('https://api.tvmaze.com/search/shows?q=$searchQuery');
  final response = await http.get(url);
  final searchResults = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return searchResults;
  } else {
    throw Exception('Failed to load');
  }
}

Future getRecommendations(userId) async {
final url = Uri.parse('https://film-fly.onrender.com/api/users/1/recommendations');
  final response = await http.get(url);
  final recomendations = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return recomendations;
  } else {
    throw Exception('Failed to load');
  }
}
