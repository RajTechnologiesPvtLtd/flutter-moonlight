import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes.dart';
import '../modules.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Get.find<AuthController>().logOut(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: () => Get.toNamed(Routes.items),
                title: const Text('Sqflite CRUD'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
