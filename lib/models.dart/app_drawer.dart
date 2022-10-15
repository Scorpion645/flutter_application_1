import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models.dart/category_item.dart';
import 'package:flutter_application_1/screens/categories_screen.dart';
import 'package:flutter_application_1/screens/favorites_screen.dart';
import 'package:flutter_application_1/screens/filters_screen.dart';
import 'package:flutter_application_1/screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحى',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuildListMethod(context, TabsScreen(), Icons.card_travel, 'الرحلات'),
          BuildListMethod(context, FiltersScreen(), Icons.filter_list, 'الفلترة')
        ],
      ),
    );
  }

  Widget BuildListMethod(BuildContext context, Widget destination, IconData icon, String text) {
    return ListTile(
          onTap: () {
            CategoryItem.selectCategory(context,destination);
          },
          leading: Icon(
           icon,
            size: 30,
            color: Colors.blue,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
  }
}
