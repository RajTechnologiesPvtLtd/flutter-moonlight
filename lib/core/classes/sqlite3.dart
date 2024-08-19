import 'package:sqlite3/sqlite3.dart';

class Sqlite3 {
  final db = sqlite3.openInMemory();
  late String table;
  late String where;

  Sqlite3() {
    print('sqlite3 ${sqlite3.version}');
  }

  Future createTable() async {
    // Create a table and insert some data
    db.execute('''
    CREATE TABLE artists (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL
    );
  ''');
  }

  List<Map<String, dynamic>> get() {
    String query = 'SELECT * FROM $table';
    List<Object?> args = [];

    if (where.isNotEmpty) {
      query += ' WHERE $where';
    }

    // if (orderBy.isNotEmpty) {
    //   query += ' ORDER BY $orderBy';
    // }

    return db.select(query, args).map((row) {
      return Map<String, dynamic>.from(row);
    }).toList();
  }

  Future getOne() async {}

  Future insert() async {
    // Prepare a statement to run it multiple times:
    final stmt = db.prepare('INSERT INTO artists (name) VALUES (?)');
    stmt
      ..execute(['The Beatles'])
      ..execute(['Led Zeppelin'])
      ..execute(['The Who'])
      ..execute(['Nirvana']);

    // Dispose a statement when you don't need it anymore to clean up resources.
    stmt.dispose();
  }

  Future update(data) async {}
}
