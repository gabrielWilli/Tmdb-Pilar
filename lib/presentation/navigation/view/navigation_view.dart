import 'package:flutter/material.dart';
import 'package:tmdb_pilar/core/utils/enum/navigation_items_enum.dart';
import 'package:tmdb_pilar/presentation/home/view/home_page.dart';
import 'package:tmdb_pilar/presentation/search/view/search_page.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentIndex = 0;

  final pages = [
    const HomePage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => currentIndex = value),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[300],
        selectedItemColor: const Color(0XFF0D253F),
        items: List.generate(
          NavigationItemsEnum.values.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(NavigationItemsEnum.values[index].icon),
            label: NavigationItemsEnum.values[index].label,
          ),
        ),
      ),
    );
  }
}
