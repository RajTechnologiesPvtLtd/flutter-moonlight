import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/widgets.dart';
import '../../routes.dart';
import 'home_controller.dart';
import 'item_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtr = TextEditingController();
    TextEditingController descriptionCtr = TextEditingController();

    _deleteRecord(int id) async {
      await controller.delete(id);
      showMessage(context, "Successfully deleted a record!");
    }

    _saveRecord(int? id) async {
      await controller.save(
        ItemModel(
          id: id,
          title: titleCtr.text,
          description: descriptionCtr.text,
        ),
      );
      showMessage(context, "Successfully created a record!");
      Navigator.pop(context);
    }

    _showForm(int? id) async {
      // if (id != null) {
      //   final existingRecord =
      //       _records.firstWhere((element) => element['id'] == id);
      //   _titleCtr.text = existingRecord['title'];
      //   _descriptionCtr.text = existingRecord['description'];
      // }
      showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MLTextField(labelText: "Title", controller: titleCtr),
              sizedBoxByHeight(10),
              MLTextField(labelText: "Description", controller: descriptionCtr),
              sizedBoxByHeight(10),
              mlButton("Save", () => _saveRecord(id)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () => Get.toNamed(Routes.login),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.records.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('No records found'),
              ],
            ),
          );
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              // controller.loadRecords();
            }
            return true;
          },
          child: ListView.builder(
            itemCount: controller.records.length,
            itemBuilder: (context, index) {
              final record = controller.records[index];
              return Card(
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(record.title),
                  subtitle: Text(record.description),
                  trailing: PopupMenuButton(
                    child: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text("Edit"),
                        onTap: () => _showForm(record.id),
                      ),
                      PopupMenuItem(
                        child: const Text("Delete"),
                        onTap: () => _deleteRecord(record.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
