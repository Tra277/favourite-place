import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(8))),
        child:  Center(child: Text(
          'No Location Chosen',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
          
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(onPressed: (){}, label: const Text('Current Location'), icon: const Icon(Icons.location_on),),
          TextButton.icon(onPressed: (){}, label: const Text('Select on Map'), icon: const Icon(Icons.map),),
        ],
      ),
    ],);
  }
}