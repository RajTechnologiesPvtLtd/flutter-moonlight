import 'package:flutter/material.dart';

Widget noMoreContent() {
  return Container(
    padding: const EdgeInsets.only(top: 15, bottom: 15),
    // color: Colors.amber,
    child: const Center(
      child: Text('You have fetched all of the content'),
    ),
  );
}
