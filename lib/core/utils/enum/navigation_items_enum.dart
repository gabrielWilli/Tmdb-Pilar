import 'package:flutter/material.dart';

enum NavigationItemsEnum {
  home(label: "Home", icon: Icons.home_outlined),
  search(label: "Search", icon: Icons.search_outlined);

  const NavigationItemsEnum({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}
