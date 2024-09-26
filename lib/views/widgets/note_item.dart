import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(EditNoteView.id);
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              note.title,
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
            subtitle: Text(
              note.content,
              style: const TextStyle(color: Colors.black54),
            ),
            trailing: IconButton(
              onPressed: () {
                note.delete();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              note.date,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
