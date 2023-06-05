import 'package:exemplo/Aula01/drawer_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidgetsApp extends StatefulWidget {
  const MyWidgetsApp({super.key});

  @override
  State<MyWidgetsApp> createState() => _MyWidgetsStateApp();
}

class _MyWidgetsStateApp extends State<MyWidgetsApp> {
  PageController _pageController = PageController();
  int indexBottomNavigationBar = 0;

  void mudar(int page) {
    setState(() {
      //_pageController.jumpToPage(page);
      _pageController.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
      indexBottomNavigationBar = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: DrawerApp(_pageController, mudar),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar,
        onTap: (int page) {
          mudar(page);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Item 1'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Item 2'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Item 3'),
        ],
      ),
    );
  }
}
