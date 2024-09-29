//Flutter:|||||||||||||
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int chosenIndex = 0;
  final List<Color> colorsList = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.pink,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  chosenIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colorsList[index].value;
                });
              },
              child: ColorItem(
                isChosen: chosenIndex == index,
                color: colorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
