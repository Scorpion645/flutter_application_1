import 'package:flutter/material.dart';
import 'package:flutter_application_1/models.dart/appBar.dart';

import '../app_data.dart';
import '../models.dart/category_trips_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  final String appBarTitle;
  final String categoryId;
  final String tripId;
  const CategoryTripsScreen(
      {super.key, required this.appBarTitle, required this.categoryId, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final displayTrips = Trips_data.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: myAppBar(appBarTitle),
        body: ListView.builder(
            itemCount: displayTrips.length,
            itemBuilder: ((context, index) {
              return CategoryTripsItem(
                imageUrl: displayTrips[index].imageUrl,
                duration: displayTrips[index].duration,
                season: displayTrips[index].season,
                text: displayTrips[index].title,
                tripType: displayTrips[index].tripType,
                id: displayTrips[index].id,
              );
            })));
  }
}
