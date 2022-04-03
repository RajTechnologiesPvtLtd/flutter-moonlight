import 'package:flutter/material.dart';

import '../avatar.dart';
import '../call-button.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        //tileColor: WhiteColor,
        isThreeLine: true,
        leading: Avatar(),
        title: Text('Bhargav Raviya'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ahmedabad, Gujarat'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.assistant_direction),
                SizedBox(
                  width: 10,
                ),
                CallButton(),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.share),
              ],
            )
          ],
        ),
      ),
    );
  }
}
