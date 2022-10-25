import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_data.dart';
import 'package:flutter_application_1/models.dart/appBar.dart';

class TripDetailsScreen extends StatelessWidget {
  final String tripId;

  const TripDetailsScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final selectedTrip = Trips_data.firstWhere(
      (element) {
        return element.id == tripId;
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
        leading: BackButton(onPressed: () => Navigator.of(context).pop(false)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image(
                image: NetworkImage(selectedTrip.imageUrl),
              ),
            ),
            buildTitleBar(
              text: 'الأنشطة',
            ),
            ListContainer(
              newWidget: ListView.builder(
                  itemCount: selectedTrip.activities.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          child: Text(selectedTrip.activities[index],
                              textAlign: TextAlign.right)),
                    );
                  })),
            ),
            buildTitleBar(text: 'البرنامج اليومى'),
            ListContainer(
              newWidget: ListView.builder(
                  itemCount: selectedTrip.program.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      trailing: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          '${index} يوم',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        selectedTrip.program[index],
                        textAlign: TextAlign.right,
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(Icons.delete, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(tripId);
            print(tripId);
          }),
    );
  }
}

class ListContainer extends StatelessWidget {
  final Widget newWidget;

  const ListContainer({
    Key? key,
    required this.newWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: newWidget,
    );
  }
}

class buildTitleBar extends StatelessWidget {
  final String text;
  const buildTitleBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 20, top: 5),
        child: Text(
          text,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue),
        ));
  }
}
