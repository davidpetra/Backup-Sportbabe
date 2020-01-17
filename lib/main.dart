import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportBabe',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget{
  const MyHome({Key key}): super(key: key);

  State<StatefulWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<MyHome>{
  int _currentTabIndex =0;

  Widget build(BuildContext context){
    final _kTabPages = <Widget>[
      Center(
        child: Text('Home Page'),
      ),
      Center(
        child: Text('My Booking'),
      ),
      Center(
        child: Text('Account'),
      ),
    ];

    final _kBottomNavbarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          title: Text('HOME'),
          icon: Icon(Icons.home)
      ),
      BottomNavigationBarItem(
          title: Text('BOOKINGS'),
          icon: Icon(Icons.history)
      ),
      BottomNavigationBarItem(
          title: Text('PROFILE'),
          icon: Icon(Icons.account_circle)
      ),
    ];
    assert(_kTabPages.length == _kBottomNavbarItem.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavbarItem,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('SPORTBABE',
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 15.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 8.0,
                    color: Color.fromARGB(125, 0, 0, 255),
                  ),
                ]
            )
        ),
      ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
