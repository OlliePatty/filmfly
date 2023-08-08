import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.userId}) : super(key: key);

  final List<int>? userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  List<dynamic> recommendations = [];
  List<dynamic> results = [];
  int index = 0;

  @override
  void initState() {
    super.initState();
    getRecommendations(widget.userId).then((data) {
      return setState(() {
        recommendations = data;
      });
    }).then((value) {
      print(recommendations);
      getSearchResults(recommendations[index]).then((data) {
        print(data);
       return setState(() {
          loading = false;
          results = data;
        });
      });
    });
  }

  updateList(index) {
    getSearchResults(recommendations[index]).then((data) {
      setState(() {
        results = data;
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
          : GestureDetector(
              onHorizontalDragDown: (details) {
                updateList(index += 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '${results[0]['Poster']}'),
                        fit: BoxFit.fill,
                        alignment: const Alignment(-0.3, 0),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  '${results[0]['Title']}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '${results[0]['Year']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
