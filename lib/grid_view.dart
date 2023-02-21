import 'package:flutter/material.dart';

import 'main.dart';

class GridViewFormat extends StatefulWidget {
  final List notes;
  final deleteNote;
  const GridViewFormat({super.key, required this.notes, this.deleteNote});

  @override
  State<GridViewFormat> createState() => _GridViewFormatState();
}

class _GridViewFormatState extends State<GridViewFormat> {
  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: GridView.builder(
          itemCount: widget.notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemBuilder: (BuildContext context, int index) {
            return ConstrainedBox(
                constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 200,
                    minHeight: 100,
                    minWidth: 100),
                child: Card(
                  elevation: 4,
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 2.0,
                          right: 2.0,
                          child: PopUpOptionMenu(
                              deleteNote: widget.deleteNote, index: index)),
                      Center(child: Text(widget.notes[index])),
                    ],
                  ),
                ));
          }),
    );
  }
}
