import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;

  const CategoryItem({super.key, required this.imageUrl, required this.title, required this.id});

  static void selectCategory(context, dynamic destination) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return destination;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(
          context,
          CategoryTripsScreen(
            appBarTitle: title, categoryId: id, tripId: '',
          )),
      child: Stack(alignment: Alignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            height: 250,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
