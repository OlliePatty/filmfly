import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

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
      setState(() {
        recommendations = data;
      });
    }).then((value) {
      print(recommendations);
      return getSearchResults(recommendations[index]).then((data) {
        print(data);
        setState(() {
          loading = false;
          results = data;
        });
      });
    });
  }

  updateList(index) {
    return getSearchResults(recommendations[index]).then((data) {
      return setState(() {
        if (data == null) {
          print('Null Data');
          updateList(index += 1);
        } else {
          results = data;
        }
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
          : SwipeTo(
              onRightSwipe: () {
                if (index == recommendations.length - 1) {
                  updateList(index = 0);
                } else {
                  updateList(index += 1);
                }
              },
              iconOnRightSwipe: const IconData(0xf579,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
              onLeftSwipe: () {
                if (index == 0) {
                  updateList(index = recommendations.length - 1);
                } else {
                  updateList(index -= 1);
                }
              },
              iconOnLeftSwipe: const IconData(0xf571, fontFamily: 'MaterialIcons', matchTextDirection: true),
              animationDuration: const Duration(milliseconds: 25),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${results[0]['Poster']}'),
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
            persistentFooterButtons: [
              ElevatedButton(onPressed: () {
              }, child: const Text('Dislike'),),
              ElevatedButton(onPressed: () {
              patchUserWatchlist(widget.userId, recommendations[index]);
              }, child: const Text('Like'),),
            ],
            persistentFooterAlignment: AlignmentDirectional.bottomCenter,
    );
  }
}
