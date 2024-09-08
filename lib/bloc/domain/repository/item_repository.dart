import '../models/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
  Future<Item> getItem(int id);
  Future<void> addItem(Item item);
  Future<void> updateItem(Item item);
  Future<void> deleteItem(Item item);
}
