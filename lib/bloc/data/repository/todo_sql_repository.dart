import 'package:sqflite/sqflite.dart';

import '../../../config/config.dart';
import '../../domain/models/item.dart';
import '../../domain/repository/item_repository.dart';
import 'package:sqflite/sqflite.dart' as sql;
import '../../../core/classes/classes.dart';

class ItemSqlRepository implements ItemRepository {
  late Database db;
  String table = AppDatabase.items;
  String orderBy = 'title';

  ItemSqlRepository() {
    _initDb();
  }

  Future<void> _initDb() async {
    db = await Sqlite.db();
  }

  @override
  Future<List<Item>> getItems() async {
    final db = await Sqlite.db();
    final List<Map<String, Object?>> results =
        await db.query(table, orderBy: orderBy);
    return results.map((map) => Item.fromJson(map)).toList();
  }

  @override
  Future<Item> getItem(int id) async {
    final db = await Sqlite.db();
    final List<Map<String, Object?>> results = await db.query(table,
        where: "id = ?", whereArgs: [id], orderBy: orderBy);
    return Item.fromJson(results.first);
  }

  @override
  Future<int> addItem(Item item) async {
    final db = await Sqlite.db();
    final int id = await db.transaction<int>((txn) async {
      // Perform the insert operation inside the transaction
      return await txn.insert(table, item.toJson(),
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    });

    return id;
  }

  @override
  Future<int> updateItem(Item item) async {
    final db = await Sqlite.db();
    final int result = await db.transaction<int>((txn) async {
      // Perform the update operation inside the transaction
      return await txn.update(table, item as Map<String, Object?>,
          where: "id = ?", whereArgs: [item.id]);
    });
    return result;
  }

  @override
  Future<void> deleteItem(Item item) async {
    await db.delete(table, where: "id = ?", whereArgs: [item.id]);
  }
}
