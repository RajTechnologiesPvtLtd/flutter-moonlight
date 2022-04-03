import 'package:flutter/material.dart';

import '../avatar.dart';

class FullDataCard extends StatelessWidget {
  const FullDataCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        //tileColor: WhiteColor,
        isThreeLine: true,
        trailing: Avatar(),
        title: Text('Bhargav Raviya'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmedabad, Gujarat',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "23 Year Developer",
                  //style: TextStyle(color: BlackColor),
                )
              ],
            ),
            Text(
              'Master of Commerce',
              //style: TextStyle(color: BlackColor),
            ),
          ],
        ),
      ),
    );
  }
}
