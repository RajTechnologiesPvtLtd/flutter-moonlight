import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight/bloc/presentation/item_cubit.dart';

import '../../widgets/widgets.dart';
import '../domain/models/item.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  _showForm(BuildContext context, int? id) async {
    final itemCubit = context.read<ItemCubit>();

    final TextEditingController _titleCtr = TextEditingController();
    final TextEditingController _descriptionCtr = TextEditingController();
    if (id != null) {
      final existingRecord = await itemCubit.getItem(id);
      _titleCtr.text = existingRecord.title;
      _descriptionCtr.text = existingRecord.description;
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          // this will prevent the soft keyboard from covering the text fields
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MLTextField(labelText: "Title", controller: _titleCtr),
            const SizedBox(
              height: 10,
            ),
            MLTextField(labelText: "Description", controller: _descriptionCtr),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                itemCubit.addItem(
                  Item(
                    id: id,
                    title: _titleCtr.text,
                    description: _descriptionCtr.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text(id == null ? 'Create New' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemCubit = context.read<ItemCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoc Pattern - Items'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context, null);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<ItemCubit, List<Item>>(
        builder: (context, items) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.description),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showForm(context, item.id),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => itemCubit.deleteItem(item),
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}
