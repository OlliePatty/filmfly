import 'package:http/http.dart' as http;
import 'dart:convert';

getArticles() async {
var url = Uri.parse('https://ollies-nc-news.onrender.com/api/articles');
var response = await http.get(url);
var articlesData = jsonDecode(response.body);

if(response.statusCode == 200){
  return articlesData['articles'];
} else {
  throw Exception('Failed to load');
}
}
