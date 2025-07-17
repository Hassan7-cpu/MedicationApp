// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild({
    super.key,
    this.onsaved,
    this.hinttext,
    this.initialvalue,
  });
  final Function(String?)? onsaved;
  String? hinttext;
  String? initialvalue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(),
      ),
      initialValue: initialvalue,
      onSaved: onsaved,
    );
  }
}
