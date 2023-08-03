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

Future <http.Response> patchUser() {
  // print(endpoint);
  // print(genres);
  // print(actors);
  // print(directors);

  return http.put(
    Uri.parse('https://nc-news-service.onrender.com/api/articles/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
            
      "inc_votes": 1

    }),
  );
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


  // final url = Uri.parse('https://film-fly.onrender.com/api$endpoint');
//     final response = await http.put(url);
//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       return data;
//     } else {
//       throw Exception('Failed to load');
//     }

