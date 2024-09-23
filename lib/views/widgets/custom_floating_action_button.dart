//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_text_field.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) {
            return const AddNoteView();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        const CustomTextField(
          hintText: "Title",
        ),
        const CustomTextField(
          hintText: "Content",
          maxLines: 5,
        ),
        ElevatedButton(onPressed: () {}, child: const Text("add")),
      ],
    );
  }
}
