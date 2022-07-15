import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/colors.dart';

/// Text Field Input component

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hinText;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hinText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: textFieldBorderSideColor));
    return TextField(
      controller: textEditingController,
      style: const TextStyle(color: textFieldInputTextColor),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: const TextStyle(color: textFieldTextColor),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(15.0),
        fillColor: textFieldFillColor,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
