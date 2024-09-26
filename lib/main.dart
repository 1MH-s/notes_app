import 'package:flutter/material.dart';

//Packages:
//Bloc:|||||||||||||||||||||
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/simple_bloc_observer.dart';

//Hive:|||||||||||||||||||||
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';

//Views:|||||||||||||||||||||||
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/edit_note_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("notes");
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
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
      ),
    );
  }
}
