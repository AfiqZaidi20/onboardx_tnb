import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:onboardx_tnb/screens/setting/setting_manage_account.dart';
import 'package:onboardx_tnb/screens/myjourney/my_journey_screen.dart';
import 'package:onboardx_tnb/screens/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Pastikan constructors pada HomeScreen, MyJourneyScreen, SettingsPage adalah const jika boleh
  final List<Widget> _screens = [
    const HomeScreen(),         // Icon(Icons.home) -> HomeScreen
    const MyJourneyScreen(),    // Icon(Icons.flag) -> MyJourneyScreen
    const SettingScreen(),       // Icon(Icons.settings) -> SettingsPage (front_page.dart)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(224, 124, 124, 1);

    return Scaffold(
      // IndexedStack preserves state of each page when switching tabs
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNavBar(primaryColor),
    );
  }

  Widget _buildBottomNavBar(Color primaryColor) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: const Color.fromRGBO(224, 124, 124, 1),
      buttonBackgroundColor: primaryColor,
      height: 60,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),     // Home
        Icon(Icons.flag, size: 30, color: Colors.white),     // My Journey
        Icon(Icons.settings, size: 30, color: Colors.white), // Settings
      ],
      index: _selectedIndex,
      onTap: _onItemTapped,
      letIndexChange: (index) => true,
    );
  }
}
