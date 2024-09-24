import 'sqflite_repository.dart';

class ItemRepository extends SqfliteRepository {
  @override
  String get table => 'items';

  @override
  String get orderBy => 'id DESC';
}
