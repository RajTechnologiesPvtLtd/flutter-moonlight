import 'package:flutter/material.dart';
import '../constants/routes.dart';
import 'drawer-tile.dart';

class MoonLightDrawer extends StatelessWidget {
  final String currentPage;
  const MoonLightDrawer(this.currentPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            //color: WhiteColor,
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          accountEmail: Text("raviyatechnical@gmail.com"),
          accountName: Text("Bhargav Raviya"),
          currentAccountPicture: Image.network(
            "https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png",
            fit: BoxFit.cover,
          ),
        ),
      ),

      DrawerTile(
        title: "Home",
        icon: Icons.home,
        onTap: () {
          Navigator.of(context).popAndPushNamed(rootRoute);
        },
      ),
      DrawerTile(
        title: "Load More",
        icon: Icons.list,
        onTap: () {
          Navigator.of(context).popAndPushNamed(loadMoreRoute);
        },
      ),

      DrawerTile(
        title: "Examples",
        icon: Icons.list,
        onTap: () {
          Navigator.of(context).popAndPushNamed(exampleRoute);
        },
      ),
      DrawerTile(
        title: "Settings",
        icon: Icons.settings,
        onTap: () {
          Navigator.of(context).popAndPushNamed(settingRoute);
        },
      ),
      // Divider(),
      // DrawerTile(
      //   title: "Logout",
      //   icon: Icons.logout,
      //   onTap: () {
      //     Navigator.of(context).pushNamed(Routes.initRoute);
      //   },
      // ),
    ])));
  }
}
