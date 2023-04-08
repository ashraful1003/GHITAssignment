import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  TextView({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  String? field, value;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$field: $value",
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
