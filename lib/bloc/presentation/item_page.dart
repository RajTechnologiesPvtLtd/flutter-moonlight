import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moonlight/bloc/domain/repository/item_repository.dart';

import 'item_cubit.dart';
import 'item_view.dart';

class ItemPage extends StatelessWidget {
  final ItemRepository repository;
  const ItemPage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemCubit(repository),
      child: const ItemView(),
    );
  }
}
