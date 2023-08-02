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
