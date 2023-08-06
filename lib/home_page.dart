import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  List<dynamic> recommendations = [];
  int index = 0;

  @override
  void initState() {
    super.initState();
    getSearchResults('friends').then((data) {
      print(data[0]['show']['image']['medium']);
      setState(() {
        loading = false;
        recommendations = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.network(
                      '${recommendations[0]['show']['image']['medium']}'),
                ),
              ],
            ),
    );
  }
}
