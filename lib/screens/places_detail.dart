import 'dart:io';

import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}