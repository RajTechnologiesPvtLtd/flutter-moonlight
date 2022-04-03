import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app.dart';
import '../routes/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = homePageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case homePageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case gridviewPageDisplayName:
        return _customIcon(Icons.list, itemName);
      case loadlocalimagePageDisplayName:
        return _customIcon(Icons.list, itemName);
      case loadlocaljsonPageDisplayName:
        return _customIcon(Icons.list, itemName);
      case loadmoreusingapiPageDisplayName:
        return _customIcon(Icons.list, itemName);
      //Auth
      case logoutPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      case settingsPageDisplayName:
        return _customIcon(Icons.settings, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
