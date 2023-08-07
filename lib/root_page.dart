import 'package:filmfly/search_page.dart';
import 'package:filmfly/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:filmfly/home_page.dart';
import 'package:filmfly/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.userId}) : super(key: key);

  final List<int>? userId;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> _pages() => [
        HomePage(userId: widget.userId),
        Watchlist(userId: widget.userId),
        ProfilePage(userId: widget.userId),
      ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = _pages();
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      appBar: AppBar(
        title: const Text('Film Fly'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Watchlist'),
          NavigationDestination(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Film Fly',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
