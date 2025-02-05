import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const String routeName = '/BottomNavBarScreen';
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 20,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.details_outlined),
              label: 'Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }


 getBody() {
    if (_selectedIndex == 0 ) {
      return const HomeScreen();
    }
    if (_selectedIndex == 1) {
      return const HomeScreen();
    }
    if (_selectedIndex == 2) {
      return const HomeScreen();
    }
    return null;
  }
}