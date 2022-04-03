import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_calling() async {
  const url = 'tel:+12345678';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class CallButton extends StatelessWidget {
  const CallButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: _calling, icon: Icon(Icons.phone));
  }
}
