
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/core/colors/app_colors.dart';
import 'package:news_app/src/features/home/screens/home_screen.dart';
import 'package:news_app/src/features/settings/settings_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('More Page coming soon !')),
    const Center(child: Text('Search Page workin on it !')),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(CupertinoIcons.home, 0, ),
            _buildNavItem(CupertinoIcons.search, 1, ),
            _buildNavItem(CupertinoIcons.bookmark, 2, ),
            _buildNavItem(CupertinoIcons.settings, 3, ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index,) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? AppColors.black : AppColors.black;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              icon,
              size: 24,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w100,
              color: color
          ),
        ],
      ),
    );
  }
}