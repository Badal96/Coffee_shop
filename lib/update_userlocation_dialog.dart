import 'package:flutter/material.dart';

void showDialogFunc(BuildContext context,
    void Function(String country, String city, String adress) onpressed) {
  String country = '';
  String city = '';
  String address = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Address Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Country'),
              onChanged: (value) {
                country = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'City'),
              onChanged: (value) {
                city = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Address'),
              onChanged: (value) {
                address = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              onpressed(country, city, address);
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
