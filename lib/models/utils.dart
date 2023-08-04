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

Future postUser(name, username, email, password) async {
  final url = Uri.parse('https://film-fly.onrender.com/api/users');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "name": name,
        "username": username,
        "email_address": email,
        "password": password
      },
    ),
  );
  final data = jsonDecode(response.body);
  if (response.statusCode == 201) {
    return data;
  } else {
    throw Exception('Failed to load');
  }
}

Future patchUser(userId, genres, actors, directors) async {
  int userid = userId[0];
  
  final url = Uri.parse('https://film-fly.onrender.com/api/users/$userid');
  final headers = {'Content-Type': 'application/json'};
  final data = {"genres": genres, "actors": actors, "directors": directors};

  final response = await http.patch(url, headers: headers, body: jsonEncode(data));

  if (response.statusCode == 201) {
    print('PUT request successful');
    print(response.body);
  } else {
    print('PUT request failed');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
