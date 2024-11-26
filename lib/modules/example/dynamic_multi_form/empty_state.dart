import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String? title, message;
  const EmptyState({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 16,
      color: Theme.of(context).cardColor.withOpacity(.95),
      shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
