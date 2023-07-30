import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'controllers.dart';

class CRUDController extends BaseController {
  final String table;
  late String orderBy;

  CRUDController({required this.table, this.orderBy = "id"});

  Future<List<Map<String, dynamic>>> list() async {
    final db = await BaseController.db();
    return db.query(table, orderBy: orderBy);
  }

  Future<int> store(obj) async {
    try {
      final db = await BaseController.db();
      final int id = await db.transaction<int>((txn) async {
        // Perform the insert operation inside the transaction
        return await txn.insert(table, obj,
            conflictAlgorithm: sql.ConflictAlgorithm.replace);
      }).catchError(handleError);

      return id;
    } catch (e) {
      // Handle the error as per your requirements.
      print("Error occurred while storing data: $e");
      return -1; // Return a specific value to indicate the failure.
    }
  }

  Future<int> update(int id, dynamic obj) async {
    try {
      final db = await BaseController.db();
      final int result = await db.transaction<int>((txn) async {
        // Perform the update operation inside the transaction
        return await txn.update(table, obj, where: "id = ?", whereArgs: [id]);
      });
      return result;
    } catch (e) {
      // Handle the error as per your requirements.
      print("Error occurred while updating data: $e");
      return -1; // Return a specific value to indicate the failure.
    }
  }

  Future<void> delete(int id) async {
    final db = await BaseController.db();
    try {
      await db.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Future<int> store(obj) async {
  //   final db = await BaseController.db();
  //   final id = await db.insert(table!, obj,
  //       conflictAlgorithm: sql.ConflictAlgorithm.replace);
  //   return id;
  // }

  // Future<int> update(int id, obj) async {
  //   final db = await BaseController.db();
  //   final result =
  //       await db.update(table!, obj, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }
}
