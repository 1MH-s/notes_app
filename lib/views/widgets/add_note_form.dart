//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Packages:
//Bloc:|||||||||||||||||||||
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

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
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomElevatedButton(
                onPressed: () {
                  addNote(context);
                },
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: Center(
                      child: state is AddNoteLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text("Add", style: TextStyle(color: Colors.black))),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void addNote(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      NoteModel note = NoteModel(
        title: titleController.text,
        content: contentController.text,
        date: DateTime.now().toString(),
        color: 1,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
