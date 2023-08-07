import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({Key? key, this.userId}) : super(key: key);

  final List<int>? userId;

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}