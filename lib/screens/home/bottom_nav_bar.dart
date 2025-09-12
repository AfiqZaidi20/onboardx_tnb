import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:onboardx_tnb/screens/setting/front_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboardx_tnb/screens/myjourney/my_journey_screen.dart';
import 'package:onboardx_tnb/screens/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(224, 124, 124, 1);

    return Scaffold(
      body: Center(
        child: Text(
          "Selected Index: $_selectedIndex",
          style: const TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(primaryColor),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavBar(Color primaryColor) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: const Color.fromRGBO(224, 124, 124, 1),
      buttonBackgroundColor: primaryColor,
      height: 60,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
        Icon(Icons.settings, size: 30, color: Colors.white),
      ],
      index: _selectedIndex,
      onTap: (index) {
        if (index == 2) {
          // Settings icon tapped -> open SettingsPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        } else {
          // Handle other tabs
          _onItemTapped(index);
        }
      },
      letIndexChange: (index) => true,
    );
  }
}
