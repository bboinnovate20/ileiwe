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

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const GameScreen();
      case 2:
        return const AnalyticsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const DashboardScreen();
    }
  }

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
          _getSelectedScreen(),
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