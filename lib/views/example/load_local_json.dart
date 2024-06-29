import 'package:flutter/material.dart';
import 'dart:convert';

import '../../widgets/widgets.dart';

class LoadLocalJSONPage extends StatelessWidget {
  const LoadLocalJSONPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Load Local JSON"),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/json/users.json'),
        builder: (context, snapshot) {
          var newData = jsonDecode(snapshot.data.toString());
          return ListView.builder(
              itemCount: newData == null ? 0 : newData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(newData[index]['urlAvatar']),
                  ),
                  title: Text(newData[index]['username']),
                  subtitle: Text(newData[index]['email']),
                );
              });
        },
      ),
    );
  }
}
