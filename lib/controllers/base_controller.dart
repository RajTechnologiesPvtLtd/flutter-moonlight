import 'dart:developer';
import 'package:sqflite/sqflite.dart' as sql;
import '../config/config.dart';

class BaseController {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      AppDatabase.database,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  handleError(error) {
    inspect(error);

    // hideLoading();
    // if (error is BadRequestException) {
    //   var message = error.message;
    // } else if (error is FetchDataException) {
    //   var message = error.message;
    // } else if (error is ApiNotRespondingException) {}
  }
}
