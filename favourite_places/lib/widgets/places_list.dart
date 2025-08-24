import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({super.key, required this.places});
  List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No places added yet!',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[i].image),
        ),
        title: Text(places[i].title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        )),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => PlacesDetailScreen(place: places[i])));
        },
      ),
    );
  }
}