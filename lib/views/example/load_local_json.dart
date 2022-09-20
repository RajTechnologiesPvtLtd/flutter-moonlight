import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:moonlight/widgets/navbar.dart';

class LoadLocalJSONPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title: "Load Local JSON"),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/json/users.json'),
        builder: (context, snapshot) {
          var new_data = jsonDecode(snapshot.data.toString());
          return ListView.builder(
              itemCount: new_data == null ? 0 : new_data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(new_data[index]['urlAvatar']),
                  ),
                  title: Text(new_data[index]['username']),
                  subtitle: Text(new_data[index]['email']),
                );
              });
        },
      ),
    );
  }
}
