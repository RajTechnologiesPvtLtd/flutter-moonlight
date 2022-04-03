import 'package:flutter/material.dart';

import '../avatar.dart';
import '../call-button.dart';

class DirectoryCard extends StatelessWidget {
  const DirectoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
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
              children: [Text("23 Year Developer")],
            )
          ],
        ),
        trailing: Column(
          children: [CallButton()],
        ),
      ),
    );
  }
}
