import '../config/config.dart';
import 'controllers.dart';

class SqlController extends SqlCRUDController {
  SqlController() : super(table: AppDatabase.sqlTable);
}
