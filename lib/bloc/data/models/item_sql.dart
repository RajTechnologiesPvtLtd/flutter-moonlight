import '../../domain/models/item.dart';

class ItemSql {
  int? id;
  late String title;
  late String description;
  late bool isCompleted;

  Item toDomian() {
    return Item(
      id: id,
      title: title,
      description: description,
    );
  }

  static ItemSql fromDomain(Item item) {
    return ItemSql()
      ..id = item.id
      ..title = item.title
      ..description = item.description;
  }
}
