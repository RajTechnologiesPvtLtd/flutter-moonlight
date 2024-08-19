import '../../config/config.dart';
import '../models.dart';

class ItemSQLModel extends BaseSQLiteModel {
  @override
  String get table => AppDatabase.items;

  @override
  String get orderBy => 'title';

  String get createTableQuery => """
    CREATE TABLE $table (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  """;
}
