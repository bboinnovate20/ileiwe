import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              
              controller: controller,
              onChanged: onChanged,
              
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF8ABBFF))
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF8ABBFF))
                ),
                prefixIcon:  SvgPicture.asset("assets/icons/search.svg", height: 10, fit: BoxFit.scaleDown,),
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            decoration:  BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20)  

            ),

            child: SvgPicture.asset("assets/icons/sort.svg"),
          )
        ],
      ),
    );
  }
}