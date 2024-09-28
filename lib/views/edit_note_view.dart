//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Packages:
//Bloc:|||||||||||||||||||||
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
//Others:||||||
import 'package:intl/intl.dart';

//Models:|||||||||||||||||||||||
import 'package:notes_app/models/note_model.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/custom_icon_button.dart';
import 'package:notes_app/views/widgets/edit_note_view_body.dart';
import 'package:notes_app/views/widgets/notes_app_bar.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({super.key, required this.note});
  final NoteModel note;
  static const String id = "EditNoteView";
  GlobalKey<FormState> editFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: editFormKey,
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text("Edit note"),
          actions: [
            CustomIconButton(
              onPressed: () {
                if (editFormKey.currentState!.validate()) {
                  note.save();
                  Navigator.of(context).pop();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                }
              },
              icon: const Icon(Icons.check, size: 28),
            )
          ],
        ).build(context),
        body: EditNoteViewBody(
          note: note,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Field required';
            }
            // if all good:
            return null;
          },
        ),
      ),
    );
  }
}
