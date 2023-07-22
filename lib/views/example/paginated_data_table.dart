import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../config/config.dart';

class DataModel {
  final int id;
  final String name;
  final String email;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class PaginatedDataTableView extends StatefulWidget {
  const PaginatedDataTableView({super.key});

  @override
  State<PaginatedDataTableView> createState() => _PaginatedDataTableViewState();
}

class _PaginatedDataTableViewState extends State<PaginatedDataTableView> {
  int _currentPage = 1;
  int _pageSize = 10;
  List<DataModel> _data = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        '${ApiEndpoint.users}?page=$_currentPage')); //&pageSize=$_pageSize

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      inspect(jsonData);
      final dataList = jsonData['data']['users'] as List<dynamic>;

      final List<DataModel> newData =
          dataList.map((item) => DataModel.fromJson(item)).toList();

      setState(() {
        _data.addAll(newData);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to fetch data');
    }
  }

  void _loadMoreData() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  header: const Text('Data Table Header'),
                  rowsPerPage: _pageSize,
                  availableRowsPerPage: const [10, 25, 50],
                  onRowsPerPageChanged: (value) {
                    setState(() {
                      _pageSize = value!;
                    });
                  },
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age')),
                  ],
                  source: _DataSource(data: _data),
                ),
              ),
            ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<DataModel> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];

    return DataRow(cells: [
      DataCell(Text(item.id.toString())),
      DataCell(Text(item.name)),
      DataCell(Text(item.email.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
