import 'dart:io';
import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_places.g.dart';

@riverpod
class UserPlacesNotifier extends _$UserPlacesNotifier {
  

  @override
  List<Place> build() {
    return [];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(title: title, image: image);
    state = [newPlace, ...state];
  }

}