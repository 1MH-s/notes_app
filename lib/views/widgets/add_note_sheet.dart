//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Bloc:|||||||||||||||||||||
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
            if (state is AddNoteSuccess) {
              //Pop the sheet:
              Navigator.of(context).pop();
            } else if (state is AddNoteFailure) {
              print("Adding the note failed "
                  "withe error: ${state.errorMessage}");
            }
          }, builder: (context, state) {
            return AbsorbPointer(
              // If loading don't allow the user to press any thing:
              absorbing: state is AddNoteLoading ? true : false,
              child: const AddNoteForm(),
            );
          }),
        ),
      ),
    );
  }
}
