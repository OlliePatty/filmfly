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
  int index = 0;

  @override
  void initState() {
    super.initState();


    getSearchResults('top+gear').then((data) {
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
          : GestureDetector(
            onHorizontalDragDown: (details) {
            setState(() {
              index ++;
            });
          },

            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '${recommendations[index]['show']['image']['medium']}'),
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
                                  '${recommendations[index]['show']['name']}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '${recommendations[index]['show']['premiered'].substring(0, 4)}',
                                  style: const TextStyle(
                                    fontSize: 32,
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


// Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(50),
//                   child: Image.network(
//                       '${recommendations[0]['show']['image']['medium']}'),
//                 ),
//               ],
//             ),