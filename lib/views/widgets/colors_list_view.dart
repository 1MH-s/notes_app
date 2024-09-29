//Flutter:|||||||||||||
import 'package:flutter/material.dart';

//Widgets:|||||||||||||||||||||||||||||
import 'package:notes_app/views/widgets/color_item.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ColorItem(),
          ColorItem(),
          ColorItem(),
        ],
      ),
    );
  }
}
