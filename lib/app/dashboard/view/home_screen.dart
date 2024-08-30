import 'package:flutter/material.dart';
import 'package:ileiwe/app/analytics/views/analytics_screen.dart';
import 'package:ileiwe/app/dashboard/view/dashboard_screen.dart';
import 'package:ileiwe/app/dashboard/view/widgets/navigation_bar.dart';
import 'package:ileiwe/app/game/view/game_screen.dart';
import 'package:ileiwe/app/profile/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of widgets to display based on the selected index
  final List<Widget> _screens = [
    const DashboardScreen(),
    const GameScreen(), 
    const AnalyticsScreen(),
    const ProfileScreen(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10, // Adjust this value to match your design
            child: CustomCurvedNavigationBar(
              selectedIndex: _selectedIndex,
              onItemSelected: _onItemSelected,
            ),
          ),
        ],
      ),
    );
  }
}