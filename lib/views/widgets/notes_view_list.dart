//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Packages:
//Bloc:|||||||||||||||||||||
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

//Widgets:||||||||||||||||||||||
import 'package:notes_app/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notesList ?? [];
        return ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
              child: NoteItem(note: notesList[index]),
            );
          },
        );
      },
    );
  }
}
