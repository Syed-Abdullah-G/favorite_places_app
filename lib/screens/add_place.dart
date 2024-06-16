import 'dart:io';

import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});



  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref.read(userPlacesNotifierProvider.notifier).addPlace(enteredTitle, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 10,),
            //Image Input
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            },),
            SizedBox(height: 10,),
            LocationInput(),
            SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: Text('Add place'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
