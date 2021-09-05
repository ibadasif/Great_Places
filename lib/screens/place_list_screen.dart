import 'package:flutter/material.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AddPlacesScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Got no Places yet,start adding some!'),
        ),
        builder: (context, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.items[i].image,
                    ),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
