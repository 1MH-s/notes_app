//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/notes_app_bar.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';
import 'widgets/custom_floating_action_button.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CustomSearchIcon(
            onPressed: () {},
          ),
        ],
      ).build(context),
      body: const NotesViewBody(),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
