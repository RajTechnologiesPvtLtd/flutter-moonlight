import 'package:flutter/material.dart';

class DropdownWithSearch extends StatefulWidget {
  final List<String> options;

  const DropdownWithSearch({super.key, required this.options});

  @override
  State<DropdownWithSearch> createState() => _DropdownWithSearchState();
}

class _DropdownWithSearchState extends State<DropdownWithSearch> {
  String _selectedOption = '';
  late List<String> _filteredOptions;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
  }

  void _filterOptions(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredOptions = widget.options
            .where(
                (option) => option.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredOptions = widget.options;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          onChanged: _filterOptions,
          decoration: const InputDecoration(
            hintText: 'Search',
          ),
        ),
        DropdownButtonFormField<String>(
          value: _selectedOption,
          onChanged: (String? value) {
            setState(() {
              _selectedOption = value ?? '';
            });
          },
          items: _filteredOptions.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Options',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Perform any action with the selected option
            print('Selected Option: $_selectedOption');
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
