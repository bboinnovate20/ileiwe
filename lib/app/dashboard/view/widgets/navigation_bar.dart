import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomCurvedNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
      decoration: BoxDecoration(
        
        gradient: const LinearGradient(
          colors: [Color(0xFFA4C4F0), Color(0xFF7A00AA)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius:  BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, "home_nav", 'Home'),
          _buildNavItem(1, "game_nav", 'Game Pad'),
          _buildNavItem(2, "analytic_nav", 'Analytics'),
          _buildNavItem(3, "profile_nav", 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            SvgPicture.asset("assets/icons/$icon.svg", 
            colorFilter: isSelected ? const ColorFilter.mode(Color(0xFF6153C3), BlendMode.srcIn) : const ColorFilter.mode(Colors.white, BlendMode.srcIn)
             ),
            if (isSelected && label.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF6153C3),
                  // fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ],
          ],
        ).animate().fadeIn(),
      ),
    );
  }
}

// Usage example:
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// 
// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('Content for index $_selectedIndex')),
//       bottomNavigationBar: CustomCurvedNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }