//Flutter:|||||||||||||
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({super.key, required this.note, this.validator});
  final NoteModel note;
  final String? Function(String?)? validator;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    contentController.text = note.content;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextField(
            controller: titleController,
            validator: validator,
            onChanged: (p0) {
              note.title = titleController.text;
            },
            hintText: "Title",
          ),
          CustomTextField(
            controller: contentController,
            onChanged: (p0) {
              note.content = contentController.text;
            },
            hintText: "Content",
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
