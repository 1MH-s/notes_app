import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue),
      ),
      autofocus: true,
      onPressed: () {},
      child: const SizedBox(
        width: 100,
        height: 50,
        child: Center(child: Text("add")),
      ),
    );
  }
}
