import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
import 'drawer-tile.dart';

class MoonLightDrawer extends StatelessWidget {
  final String currentPage;
  const MoonLightDrawer(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        accountEmail: const Text(
          "linkedin.com/in/raviyatechnical",
        ),
        accountName: const Text(
          "Bhargav Raviya",
        ),
        currentAccountPicture: CircleAvatar(
          child: Image.network(
            "https://avatars.githubusercontent.com/u/46953122?v=4",
            fit: BoxFit.cover,
          ),
        ),
      ),
      DrawerTile(
        title: "Home",
        icon: Icons.home,
        onTap: () => Nav.toNamed(context, App.home),
      ),
      DrawerTile(
        title: "Examples",
        icon: Icons.list,
        onTap: () => Nav.toNamed(context, App.example),
      ),
      DrawerTile(
        title: "MVC Examples",
        icon: Icons.list,
        onTap: () => Nav.toNamed(context, App.exampleMVC),
      ),
      DrawerTile(
        title: "Load More",
        icon: Icons.list,
        onTap: () => Nav.toNamed(context, App.loadMore),
      ),
      DrawerTile(
        title: "Load More With Cache",
        icon: Icons.list,
        onTap: () => Nav.toNamed(context, App.loadMoreWithCache),
      ),
      DrawerTile(
        title: "Local Notification",
        icon: Icons.notifications,
        onTap: () => Nav.toNamed(context, App.localNotification),
      ),
      DrawerTile(
        title: "Ads Examples",
        icon: Icons.list,
        onTap: () => Nav.toNamed(context, App.exampleAds),
      ),
      DrawerTile(
        title: "Settings",
        icon: Icons.settings,
        onTap: () => Nav.toNamed(context, App.setting),
      ),
    ]));
  }
}
