import 'package:url_launcher/url_launcher.dart';

calling(phone) async {
  // const url = 'tel:+12345678';
  var url = 'tel:' + phone;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
