//Flutter:||||||||||||||||||
import 'package:flutter_bloc/flutter_bloc.dart';
//Packages
//Hive:|||||||||||||||||||||
import 'package:hive_flutter/adapters.dart';

//Models:|||||||||||||||||||||||
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  void fetchAllNotes() {
    //emit(NotesLoading());
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");
      emit(NotesSuccess(notesBox.values.toList()));
    } catch (exception) {
      emit(NotesFailure(exception.toString()));
    }
  }
}
