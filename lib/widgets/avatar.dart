import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          // height: 70.0,
          // width: 70.0,
          color: Color(0xffFF0E58),
          child: Image.network(
            "https://www.w3schools.com/w3images/avatar2.png",
            //img_avatar2
            fit: BoxFit.fill,
          ),
        ));
  }
}
