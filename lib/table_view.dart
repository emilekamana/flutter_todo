import 'package:flutter/material.dart';

import 'main.dart';

class TableViewFormat extends StatefulWidget {
  final List notes;
  final deleteNote;
  const TableViewFormat({super.key, required this.notes, this.deleteNote});

  @override
  State<TableViewFormat> createState() => _TableViewFormatState();
}

class _TableViewFormatState extends State<TableViewFormat> {
  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: DataTable(
          columns: const [
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text(''),
            ),
          ],
          rows: widget.notes
              .map((note) => DataRow(cells: [
                    DataCell(
                      Text(note),
                    ),
                    const DataCell(
                      Icon(Icons.delete),
                    ),
                  ]))
              .toList()),
    );
  }
}
