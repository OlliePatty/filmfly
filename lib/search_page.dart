import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];

  void updateList(value) {
    setState(() {
      getSearchResults(value).then((data) {
        if (data == null) {
        } else {
        searchResults = data;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 41, 78),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              onChanged: (value) {
                updateList(value);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: searchResults[index]['Title'] != null
                      ? Text(
                          '${searchResults[index]['Title']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                  subtitle: searchResults[index]['Year'] != null
                      ? Text(
                          '${searchResults[index]['Year']}',
                        )
                      : null,
                  leading: searchResults[index]['Poster'] != null
                      ? Image.network(
                          '${searchResults[index]['Poster']}')
                      : null,
                      
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
