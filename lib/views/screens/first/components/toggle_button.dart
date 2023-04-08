import 'package:flutter/material.dart';

class ToggleBtn extends StatelessWidget {
  ToggleBtn({Key? key, required this.btnName, required this.isSelected}) : super(key: key);

  String btnName;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          btnName,
          style: const TextStyle(fontSize: 20),
        ),
        Icon(
          isSelected ? Icons.toggle_on : Icons.toggle_off,
          color: Colors.lightBlue,
          size: 40,
        ),
      ],
    );
  }
}
