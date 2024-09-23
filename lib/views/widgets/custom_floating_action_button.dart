import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) {
            return const AddNoteView();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(),
        const TextField(),
        ElevatedButton(onPressed: () {}, child: const Text("add")),
      ],
    );
  }
}
