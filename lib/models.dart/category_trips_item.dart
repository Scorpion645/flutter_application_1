import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app_data.dart';
import 'package:flutter_application_1/screens/category_trips_screen.dart';

import '../screens/trip_details_screen.dart';
import 'category_item.dart';

class CategoryTripsItem extends StatelessWidget {
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  final String text;
  final String id;
  final Function removeItem;

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Recovery:
        return 'استشفاء';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Activities:
        return 'أنشطة';
        break;
      default:
        return 'غير معروف';
    }
  }

  CategoryTripsItem({
    super.key,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.text,
    required this.tripType,
    required this.id,
    required this.removeItem,
  });

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: ((context) => TripDetailsScreen(
                  tripId: id,
                ))))
        .then((result) {
      if (result != null) {
        removeItem(result);
        print(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  )),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0.5,
                      0.95
                    ],
                        colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8)
                    ])),
                padding: EdgeInsets.only(right: 20, bottom: 5),
                height: 250,
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 50, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 20)),
                  IconAndTextRow(
                    icon: Icons.today,
                    text: '${duration} أيام',
                  ),
                  IconAndTextRow(icon: Icons.sunny, text: seasonText),
                  IconAndTextRow(
                      icon: Icons.family_restroom, text: tripTypeText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconAndTextRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconAndTextRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.amber,
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
