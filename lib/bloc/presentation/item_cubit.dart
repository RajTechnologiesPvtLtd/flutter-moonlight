import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/models/item.dart';
import '../domain/repository/item_repository.dart';

class ItemCubit extends Cubit<List<Item>> {
  final ItemRepository repository;

  ItemCubit(this.repository) : super([]) {
    loadItems();
  }

  Future<void> loadItems() async {
    final items = await repository.getItems();
    emit(items);
  }

  Future<Item> getItem(int id) async {
    final item = await repository.getItem(id);
    emit([item]);
    return item;
  }

  Future<void> addItem(Item item) async {
    await repository.addItem(item);
    loadItems();
  }

  Future<void> updateItem(Item item) async {
    await repository.updateItem(item);
    loadItems();
  }

  Future<void> deleteItem(Item item) async {
    await repository.deleteItem(item);
    loadItems();
  }
}
