import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class FilterChipView extends StatefulWidget {
  const FilterChipView({super.key});

  @override
  State<FilterChipView> createState() => _FilterChipViewState();
}

class _FilterChipViewState extends State<FilterChipView> {
  final List<int> _filters = <int>[];

  Future<List<Album>>? _fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var albums = List<Album>.from(json.map((i) => Album.fromJson(i)));
      return albums;
    } else {
      throw Exception('Failed to get albums');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Chip"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Album>>(
              future: _fetchAlbums(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
                Widget result;
                if (snapshot.hasData) {
                  result = Wrap(
                    spacing: 5.0,
                    children: snapshot.data!.map((Album album) {
                      return FilterChip(
                        label: Text(album.title),
                        selected: _filters.contains(album.id),
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              if (!_filters.contains(album.id)) {
                                _filters.add(album.id);
                              }
                            } else {
                              _filters.removeWhere((int id) {
                                return id == album.id;
                              });
                            }
                          });
                        },
                      );
                    }).toList(),
                  );
                } else if (snapshot.hasError) {
                  result = Text('Error: ${snapshot.error}');
                } else {
                  result = const Text('Awaiting result...');
                }
                return result;
              },
            ),
          ],
        ),
      ),
    );
  }
}
