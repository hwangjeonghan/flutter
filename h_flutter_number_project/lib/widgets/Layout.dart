import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:h_flutter_example_project/views/AddNumberScreen.dart';
import 'package:h_flutter_example_project/views/FavoriteNumberListScreen.dart';
import 'package:h_flutter_example_project/views/RootScreen.dart';
import 'package:h_flutter_example_project/controllers/ThemeProvider.dart';

import 'ThemeProviderWidget.dart'; // Import ThemeProvider

class Layout extends StatefulWidget {
  Layout({super.key});

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Rootscreen(),
    FavoriteNumberListScreen(),
    AddNumberScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("전화번호"),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "연락처",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "북마크",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "추가",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
