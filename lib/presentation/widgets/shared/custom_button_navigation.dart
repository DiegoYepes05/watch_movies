import 'package:flutter/material.dart';

class CustomButtonNavigation extends StatelessWidget {
  const CustomButtonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.label_outline), label: 'Categories'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined), label: 'Favorite')
    ]);
  }
}
