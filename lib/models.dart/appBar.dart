
import 'package:flutter/material.dart';

AppBar myAppBar(String title) {
    return AppBar(
        title: Text(title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),centerTitle: true,
      );
  }