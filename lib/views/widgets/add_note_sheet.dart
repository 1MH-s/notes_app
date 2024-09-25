//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/custom_elevated_button.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
  });

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
          SizedBox(height: 24),
          CustomElevatedButton(
            child: SizedBox(
              width: 100,
              height: 50,
              child: Center(child: Text("add")),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
