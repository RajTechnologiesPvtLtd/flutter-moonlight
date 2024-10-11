// import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../config/config.dart';
import '../../models/models.dart';

class Sqflite {
  // ,createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

  // created_at: the time that the item was created. It will be automatically handled by SQLite
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      AppDatabase.database,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await database.execute(ItemModel().createTableQuery);
      },
    );
  }
}
