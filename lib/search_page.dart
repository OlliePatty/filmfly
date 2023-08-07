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
        searchResults = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  title: searchResults[index]['show']['name'] != null
                      ? Text(
                          '${searchResults[index]['show']['name']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                  subtitle: searchResults[index]['show']['premiered'] != null
                      ? Text(
                          '${searchResults[index]['show']['premiered'].substring(0, 4)}',
                        )
                      : null,
                  trailing:
                      searchResults[index]['show']['rating']['average'] != null
                          ? Text(
                              '${searchResults[index]['show']['rating']['average']}/10',
                            )
                          : const Text('N/A'),
                  leading: searchResults[index]['show']['image'] != null
                      ? Image.network(
                          '${searchResults[index]['show']['image']['medium']}')
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
