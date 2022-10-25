import 'package:flutter/material.dart';
import 'package:flutter_application_1/models.dart/appBar.dart';
import '../app_data.dart';
import '../models.dart/category_trips_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryTripsScreen(
      {super.key, required this.categoryId, required this.categoryTitle});
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    // TODO: implement initState
    displayTrips = Trips_data.where((trip) {
      return trip.categories.contains(widget.categoryId);
    }).toList();

    print('display trips count is + ${displayTrips.length}');

    super.initState();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
      print(
          'after removetrip the display trip count is + ${displayTrips.length}');
      print(tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(widget.categoryTitle),
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
                removeItem: _removeTrip,
              );
            })));
  }
}
