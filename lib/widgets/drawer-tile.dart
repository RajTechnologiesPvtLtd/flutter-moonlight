import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  //final Function onTap;
  final onTap;
  final bool isSelected;
  final Color iconColor;

  const DrawerTile(
      {required this.title,
      required this.icon,
      this.onTap,
      this.isSelected = false,
      this.iconColor = TextColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              //color: isSelected ? PrimaryColor : WhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Icon(
                icon, size: 20,
                //color: isSelected ? WhiteColor : iconColor
                color: Theme.of(context).iconTheme.color,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title,
                    style: TextStyle(
                      letterSpacing: .3,
                      fontSize: 15,
                      //color: isSelected ? WhiteColor : Color.fromRGBO(0, 0, 0, 0.7)
                    )),
              )
            ],
          )),
    );
  }
}
