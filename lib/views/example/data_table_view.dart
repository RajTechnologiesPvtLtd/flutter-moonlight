import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class Field {
  final String label;
  final String name;

  Field({required this.label, required this.name});
}

class DataTableView extends StatefulWidget {
  const DataTableView({super.key});

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'name': 'John',
      'age': 25,
      "field": {"name": "test"}
    },
    {
      'id': 2,
      'name': 'Jane',
      'age': 30,
      "field": {"name": "test"}
    },
    {
      'id': 3,
      'name': 'Alice',
      'age': 28,
      "field": {"name": "test"}
    },
  ];

  List<Field> fields = [
    Field(label: 'ID', name: 'id'),
    Field(label: 'Name', name: 'name'),
    Field(label: 'Age', name: 'age'),
  ];

  DataTable _buildDataTable(
      List<Map<String, dynamic>> data, List<Field> fields) {
    List<DataColumn> columns = fields.map((field) {
      return DataColumn(label: Text(field.label));
    }).toList();

    List<DataRow> rows = data.map((item) {
      return DataRow(
          cells: fields.map((field) {
        return DataCell(Text(item[field.name].toString()));
      }).toList());
    }).toList();

    return DataTable(
      columns: columns,
      rows: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Dynamic DataTable"),
      body: SizedBox(
          width: double.infinity, child: _buildDataTable(data, fields)),
    );
  }
}
