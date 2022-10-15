
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models.dart/appBar.dart';
import 'package:flutter_application_1/screens/categories_screen.dart';
import 'package:flutter_application_1/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedScreen = 0;

  final List<Map<String, dynamic>> screens = [
    {'screen':  CategoriesScreen(), 'title': 'تصنيفات الرحلات'},
    {'screen':  FavoritesScreen(), 'title': 'المفضلة'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('${screens[selectedScreen]['title']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
      ),
      body: screens[selectedScreen]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: selectedScreen,
          onTap: (int index) {
            setState(() {
              selectedScreen = index;
            });
          },
          backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'التصنيفات',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
          ]),
    );
  }
}
