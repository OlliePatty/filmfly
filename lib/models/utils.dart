import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:filmfly/director_preferences_page.dart';
import 'package:filmfly/models/preferences.dart';

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

Future<void> patchUser() async {
  final url = Uri.parse(
      'https://film-fly.onrender.com/api/users/4'); 
  final headers = {'Content-Type': 'application/json'};
  final data = {
    "genres": ,
    "actors": [],
    "directors": ["Christopher Nolan"]
  }; 

  final response =
      await http.patch(url, headers: headers, body: jsonEncode(data));
  print(response.statusCode);
  if (response.statusCode == 201) {
    print('PUT request successful');
    print(response.body);
  } else {
    print('PUT request failed');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

Future<http.Response> postUser() {
  return http.post(
    Uri.parse('https://film-fly.onrender.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "name": "Alwin",
      "username": "Milesperalwin",
      "email_address": "email.com",
      "password": "password123"
    }),
  );
}
