//Flutter:
import 'package:flutter/material.dart';

//Widgets:
import 'package:notes_app/views/widgets/notes_view_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: NotesListView(),
    );
  }
}
