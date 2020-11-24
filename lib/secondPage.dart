import 'package:flutter/material.dart';
import 'package:lab6/personData.dart';

class NextPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 10,
              child: ListView(children: buildListItems()),
            ),
            Expanded(
              child: ElevatedButton(
                child: Text('Back'),
                onPressed: () => {
                  Navigator.pop(context) // navigate to first route
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildListItems() {
    List<IPerson> persons = [
      PersonAddress('Daniel', 'Haidara'),
      PersonAddress('Oleksiy', 'Hoholya'),
      PersonAddress('Dmitro', 'Shevchenka'),
      PersonInfo('Ivan', '0661234556'),
      PersonAddress('Eduard', 'Sumhaitska'),
      PersonAddress('Vladislav', 'Lisova'),
      PersonInfo('Dmitro', '0733455678'),
      PersonInfo('Oleksandr', '0957654567'),
    ];

    return persons.map((item) {
      switch (item.getType()) {
        case 1:
          return buildAddressItem(
              (item as PersonAddress).name, (item as PersonAddress).address);
        case 2:
          return buildInfoItem(
              (item as PersonInfo).name, (item as PersonInfo).info);
      }
    }).toList();
  }

  Widget buildAddressItem(String name, String address) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(backgroundColor: Colors.green),
          ),
          Text(
            address,
            style: TextStyle(backgroundColor: Colors.cyan),
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem(String name, String info) {
    return Card(
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(backgroundColor: Colors.greenAccent),
          ),
          Text(
            info,
            style: TextStyle(backgroundColor: Colors.amberAccent),
          ),
        ],
      ),
    );
  }
}
