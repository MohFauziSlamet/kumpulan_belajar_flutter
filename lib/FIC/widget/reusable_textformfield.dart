import 'package:flutter/material.dart';

class ReusTextFormField extends StatefulWidget {
  String label;
  String? hintText;
  String? helperText;
  IconData? icon;
  int? maxLenght;
  bool obscureText;
  String? Function(String?)? validator;
  ReusTextFormField({
    Key? key,
    required this.label,
    this.icon,
    this.hintText,
    this.helperText,
    this.maxLenght,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<ReusTextFormField> createState() => _ReusTextFormFieldState();
}

class _ReusTextFormFieldState extends State<ReusTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLenght,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        suffixIcon: Icon(
          widget.icon,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        helperText: widget.helperText,
      ),
      onChanged: (value) {},
      validator: widget.validator,
    );
  }
}
