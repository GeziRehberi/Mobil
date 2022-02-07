import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  var _currentIndex = 0;

  final screens = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: [
            screens[_currentIndex],
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              title: const Text("Harita"),
              selectedColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
