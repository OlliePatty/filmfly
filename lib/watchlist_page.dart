import 'dart:ffi';

import 'package:filmfly/models/utils.dart';
import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {
  Watchlist({Key? key, this.userId}) : super(key: key);

  final List<int>? userId;

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  bool loading = true;
  List<dynamic> likes = [];
  List<dynamic> images = [];

  @override
  void initState() {
    super.initState();

    getUserLikes(widget.userId).then(
      (value) {
        loading = false;
        
        likes = value[0]['liked_movies']['liked'];
        print(likes);
      },
    ).then((value) {

        for (var i = 0; i < likes.length; i++) {
          getSearchResults(likes[i]).then((value) {
            images.add(value[0]['Poster']);
          });
        }
        print(images.length);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Your Watchlist:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation:3,
                                child: Row(
                              children: [
                                Image(
                        
                                    height: 150,
                                    image: NetworkImage(images[index])),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    likes[index],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ));
                          }),
                    )
                  ],
                ),
              ));
  }
}



// ListTile(
//                               leading:
//                                   Image(height: 120,image: NetworkImage(images[index])),
//                               shape: const Border(
//                                   bottom: BorderSide(color: Colors.black26)),
//                               title: tempRec[index] != null
//                                   ? Text(tempRec[index])
//                                   : null,