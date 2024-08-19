import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../core/classes/classes.dart';

abstract class BaseSQLModel {
  String get table;
  String get orderBy;

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await Sqflite.db();
    return db.query(table, orderBy: orderBy);
  }

  Future<Map<String, dynamic>?> getById(int id) async {
    final db = await Sqflite.db();
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
    return maps.isNotEmpty ? maps.first : null;
  }

  Future<Map<String, dynamic>?> getBySlug(String slug) async {
    final db = await Sqflite.db();
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: "slug = ?",
      whereArgs: [slug],
    );
    return maps.isNotEmpty ? maps.first : null;
  }

  static Future<Map<String, dynamic>?> getBy(
      Map<String, dynamic> criteria) async {
    final db = await Sqflite.db();
    String whereClause = criteria.keys.map((key) => '$key = ?').join(' AND ');
    List<dynamic> whereArgs = criteria.values.toList();

    final result = await db.query('your_table_name',
        where: whereClause, whereArgs: whereArgs);
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> store(obj) async {
    try {
      final db = await Sqflite.db();
      final int id = await db.transaction<int>((txn) async {
        // Perform the insert operation inside the transaction
        return await txn.insert(table, obj,
            conflictAlgorithm: sql.ConflictAlgorithm.replace);
      });

      return id;
    } catch (e) {
      debugPrint("MySql Error storing data: $e");
      return -1; // Return a specific value to indicate the failure.
    }
  }

  Future<int> update(int id, dynamic obj) async {
    try {
      final db = await Sqflite.db();
      final int result = await db.transaction<int>((txn) async {
        // Perform the update operation inside the transaction
        return await txn.update(table, obj, where: "id = ?", whereArgs: [id]);
      });
      return result;
    } catch (e) {
      debugPrint("MySql Error updating data: $e");
      return -1; // Return a specific value to indicate the failure.
    }
  }

  Future<void> delete(int id) async {
    final db = await Sqflite.db();
    try {
      await db.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("MySql Error deleting an item: $err");
    }
  }

  Future<void> truncate() async {
    final db = await Sqflite.db();
    try {
      await db.transaction((txn) async {
        await txn.rawDelete('DELETE FROM $table');
        await txn.delete('sqlite_sequence',
            where: "name = ?",
            whereArgs: [table]); // This resets the autoincrement counter.
      });
    } catch (err) {
      debugPrint("MySql Error truncate an item: $err");
    }
  }

  Future<int> updateOrCreate(
      Map<String, dynamic> criteria, Map<String, dynamic> record) async {
    try {
      var dbRecord = await getBy(criteria);
      if (dbRecord != null) {
        return update(dbRecord['id'], record);
      } else {
        return store(record);
      }
    } catch (e) {
      debugPrint("MySql Error updateOrCreate data: $e");
      return -1; // Return a specific value to indicate the failure.
    }
  }

  // create and update function using slug as unique key
  Future updateOrCreateBySlug(String slug, dynamic record) async {
    try {
      var dbRecord = await getBySlug(slug);
      if (dbRecord != null) {
        return update(dbRecord['id'], record);
      } else {
        return store(record);
      }
    } catch (e) {
      debugPrint("MySql Error storing data: $e");
      return -1; // Return a specific value to indicate the failure.
    }
  }
}
