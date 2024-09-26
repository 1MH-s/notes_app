//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_elevated_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController(),
      contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextField(
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "This field is required";
              } // else If all good:
              return null;
            },
            controller: titleController,
            hintText: "Title",
          ),
          CustomTextField(
            controller: contentController,
            hintText: "Content",
            maxLines: 8,
          ),
          const SizedBox(height: 24),
          CustomElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: const SizedBox(
              width: 100,
              height: 50,
              child: Center(child: Text("Add")),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
