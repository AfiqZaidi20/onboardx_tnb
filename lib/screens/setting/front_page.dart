import 'package:flutter/material.dart';
import 'package:onboardx_tnb/screens/setting/setting_manage_account.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:onboardx_tnb/screens/home/home_screen.dart';

// Add placeholder pages for navigation (create these files if they don't exist)
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Home Page')));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Profile Page')));
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 2; // Settings is selected by default

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    
    setState(() => _selectedIndex = index);
    
    if (index == 0) {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) =>  ManageAccountPage()),
      // );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(224, 124, 124, 1);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFE57373),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Setting",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Menu Items
            HoverMenuItem(
              icon: Icons.account_circle,
              title: "Manage Your Account",
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => ()),
              //   );
              // },
            ),
            HoverMenuItem(icon: Icons.phone_android, title: "Device Permission"),
            HoverMenuItem(icon: Icons.translate, title: "Language and Translations"),
            HoverMenuItem(icon: Icons.dark_mode, title: "Dark Mode"),

            const Spacer(),

            // Version text
            const Padding(
              padding: EdgeInsets.only(bottom: 12, right: 12),  
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Version 1.0.0",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HoverMenuItem remains the same
class HoverMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const HoverMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  _HoverMenuItemState createState() => _HoverMenuItemState();
}

class _HoverMenuItemState extends State<HoverMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: _isHovered ? Colors.grey[400] : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(widget.icon, color: Colors.black, size: 24),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}