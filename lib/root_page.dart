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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Film Fly'),
            SizedBox(
              height: 25,
              width: 25,
              child: Image.asset('/Users/oliverpatrick/Project/filmfly/lib/Logo/filmflywhite.png'),),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 46, 41, 78),
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
        backgroundColor: const Color.fromARGB(255, 46, 41, 78),
        indicatorColor: const Color.fromARGB(255, 217, 3, 104),
        selectedIndex: currentPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home, color: Colors.white), label: '',),
          NavigationDestination(icon: Icon(Icons.list, color: Colors.white), label: ''),
          NavigationDestination(
              icon: Icon(Icons.account_circle, color: Colors.white), label: ''),
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
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 46, 41, 78),
              ),
              child: Column(
                children: [
                  SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('/Users/oliverpatrick/Project/filmfly/lib/Logo/filmflywhite.png'),),
                 const Text(
                    'Film Fly',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
