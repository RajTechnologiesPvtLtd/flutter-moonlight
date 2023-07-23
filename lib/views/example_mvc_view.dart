import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
import '../widgets/widgets.dart';

class ExampleMVCView extends StatelessWidget {
  const ExampleMVCView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Home"),
      appBar: const Navbar(title: "Examples"),
      bottomNavigationBar: const BannerAdWidget(),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Center(child: Text("Counter MVC")),
              onTap: () => Nav.toNamed(context, App.exampleCounterMVC),
            ),
            ListTile(
              title: const Center(child: Text("load More MVC")),
              onTap: () => Nav.toNamed(context, App.loadMoreMVC),
            ),
          ],
        ),
      ),
    );
  }
}
