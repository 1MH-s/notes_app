//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:||||||||||||||||||||||
import 'package:notes_app/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 16),
          child: NoteItem(),
        );
      },
    );
  }
}
