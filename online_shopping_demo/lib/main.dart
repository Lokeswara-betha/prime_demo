import 'package:flutter/material.dart';
import 'package:online_shopping_demo/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon prime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff0d1a30),
          title: app_title(),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text('Home'),
              ),
              Tab(
                child: Text('TV Shows'),
              ),
              Tab(
                child: Text('Movies'),
              ),
              Tab(
                child: Text('Kids'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(''),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_download),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(''),
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
        ),
        backgroundColor: Color(0xff0d1a30),
        body: TabBarView(
          children: [
            Home(tabName: 'homePage'),
            Home(tabName: 'tvShows'),
            Home(tabName: 'movies'),
            Home(tabName: 'kids'),
          ],
        ),
      ),
    );
  }

  app_title() {
    return Center(
      child: RichText(
          text: TextSpan(
        text: 'prime',
        style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16),
        children: <TextSpan>[
          TextSpan(
              text: ' video',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      )),
    );
  }
}
