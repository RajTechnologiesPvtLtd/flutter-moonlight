import 'package:flutter/material.dart';

class NoMoreContent extends StatelessWidget {
  const NoMoreContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      // color: Colors.amber,
      child: Center(
        child: Text('You have fetched all of the content'),
      ),
    );
  }
}
