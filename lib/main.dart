import 'package:flutter/material.dart';

//Packages:
//Hive:|||||||||||||
import 'package:hive_flutter/hive_flutter.dart';

//Views:|||||||||||||||||||||||
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/edit_note_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("notes");
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes app',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routes: {
        NotesView.id: (context) => const NotesView(),
        EditNoteView.id: (context) => const EditNoteView(),
      },
      initialRoute: NotesView.id,
    );
  }
}
