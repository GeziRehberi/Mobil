import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/harita_ekrani.dart';
import 'package:flutter_widgets/pages/katki_ekrani.dart';
import 'package:flutter_widgets/view/oylama_ekrani.dart';
import 'package:flutter_widgets/pages/profil_ekrani.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  var _currentIndex = 0;

  final screens = [
    HaritaSayfasi(),
    KatkiSayfasi(),z
    OylamaSayfasi(),
    ProfilSayfasi(),
  ];

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
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
              title: const Text("Katkı"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.favorite,
                size: 30,
              ),
              title: const Text("Oylama"),
              selectedColor: Colors.red,
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text("Profil"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
