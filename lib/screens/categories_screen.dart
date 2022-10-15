import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_data.dart';

import '../models.dart/appBar.dart';
import '../models.dart/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar('التصنيفات'),
      body: GridView.builder(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
          itemBuilder: ((context, index) {
            return CategoryItem(
              imageUrl: Categories_data[index].imageUrl,
              title: Categories_data[index].title,
              id: Categories_data[index].id,
            );
          })),
      
    );
  }
}
