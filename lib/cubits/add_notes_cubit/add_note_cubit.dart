//Flutter:||||||||||||||||||
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//Packages:
//Hive:|||||||||||||||||||||
import 'package:hive_flutter/adapters.dart';

//Models:|||||||||||||||||||||||
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int color = Colors.blue.value;
  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    note.color = color;
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (exception) {
      emit(AddNoteFailure(exception.toString()));
    }
  }
}
