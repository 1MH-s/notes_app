//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextField(
            hintText: "Title",
          ),
          CustomTextField(
            hintText: "Content",
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
