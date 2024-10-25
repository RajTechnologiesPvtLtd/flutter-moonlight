import 'package:flutter/material.dart';

import '../../../repositories/item_repository.dart';
import 'sqflite_crud_controller.dart';

class SqfliteItemController extends SqfliteCrudController {
  SqfliteItemController(State state)
      : super(
          state,
          ItemRepository(),
          [
            {
              'name': 'title',
              'label': 'Title',
              'type': 'text',
            },
            {
              'name': 'description',
              'label': 'Description',
              'type': 'text',
            },
          ],
        );
}
