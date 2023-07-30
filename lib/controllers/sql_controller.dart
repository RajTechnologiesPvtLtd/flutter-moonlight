import '../config/config.dart';
import 'controllers.dart';

class SqlController extends CRUDController {
  SqlController() : super(table: AppDatabase.sqlTable);
}
