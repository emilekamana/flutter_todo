import 'package:flutter/material.dart';
import 'package:flutter_todo/grid_view.dart';
import 'package:flutter_todo/table_view.dart';

void main() {
  // Running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Creating initial app and setting theme color
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() =>
      _HomeState(); // creating state since it will be dynamic
}

class _HomeState extends State<Home> {
  String input = "";

  late bool viewGrid; // declare variables for the state

  List notes = [];

  @override
  void initState() {
    notes.add('To do 1');
    notes.add('To do 2');
    notes.add('To do 3');
    viewGrid = true;
    super.initState();
  }

  deleteNote(index) {
    // deleting notes and changing state
    setState(() {
      notes.removeAt(index);
    });
  }

  clearNotes() {
    // deleting all notes and changing state
    setState(() {
      notes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // safe area to prevent overflow with device features
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          title: const Text(
            'Tasks',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 2),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.grid_view_outlined),
              tooltip: 'Change view mode',
              onPressed: () {
                setState(() {
                  if (viewGrid) {
                    viewGrid = false;
                  } else {
                    viewGrid = true;
                  }
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // Button to open dialog box and create new note
          backgroundColor: Colors.blue,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    // alert dialog for the inputs
                    title: const Text(
                      'New note',
                      style: TextStyle(color: Colors.black),
                    ),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),
                    content: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Write here',
                      ),
                      onChanged: (value) {
                        input = value;
                      },
                    ),
                    actions: [
                      SizedBox(
                        // sized box to determine size of child
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.all(20),
                            ),
                            onPressed: () {
                              setState(() {
                                notes.add(input);
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Create note',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                  fontSize: 24),
                            )),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(
            // Icon
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
        body: viewGrid
            ? GridViewFormat(
                notes: notes,
                deleteNote: deleteNote,
              )
            : TableViewFormat(
                notes: notes,
              ),
      ),
    );
  }
}

enum MenuOptions { Delete, Edit }

class PopUpOptionMenu extends StatelessWidget {
  // pop up menu for the cards
  final index;
  final deleteNote;
  const PopUpOptionMenu({super.key, this.deleteNote, this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton<MenuOptions>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOptions>>[
          // Options for the menu
          PopupMenuItem(
            value: MenuOptions.Delete,
            child: FittedBox(
                child: Row(
              children: const [
                Icon(Icons.delete),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text('Delete'),
                ),
              ],
            )),
          ),
          // const PopupMenuItem(
          //   child: Text('Edit'),
          //   value: MenuOptions.Edit,
          // )
        ];
      },
      onSelected: (value) {
        // set actions for the menu
        switch (value) {
          case MenuOptions.Delete:
            // TODO: Handle this case.
            deleteNote(index);
            break;
          case MenuOptions.Edit:
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
}
