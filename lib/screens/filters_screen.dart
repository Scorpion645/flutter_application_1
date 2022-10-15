
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models.dart/appBar.dart';
import 'package:flutter_application_1/models.dart/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('صفحة الفلترة'),
      drawer: AppDrawer(),
      body: Center(child: Text('this is filters screen')),
    );
  }
}
