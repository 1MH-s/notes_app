//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_icon_button.dart';
import 'package:notes_app/views/widgets/edit_note_view_body.dart';
import 'package:notes_app/views/widgets/notes_app_bar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static const String id = "EditNoteView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Edit note"),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: const Icon(Icons.check, size: 28),
          )
        ],
      ).build(context),
      body: const EditNoteViewBody(),
    );
  }
}
