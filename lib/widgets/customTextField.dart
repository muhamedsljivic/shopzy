import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_mate/utilities/globalVariables.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final Function(String) onChanged;
  final VoidCallback onTap;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final bool? readOnly;
  final bool? textCapitalization;
  final bool? isObscure;
  const CustomTextField(
      {super.key,
      required this.onChanged,
      required this.validator,
      required this.controller,
      required this.hintText,
      required this.onTap,
      this.textCapitalization,
      this.readOnly,
      this.isObscure});

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    super.dispose();
  }

  GlobalVariables globalVariables = GlobalVariables();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization == null
          ? TextCapitalization.none
          : TextCapitalization.words,
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText:
          widget.isObscure == null || widget.isObscure == false ? false : true,
      onTap: widget.onTap,
      readOnly: widget.readOnly == true ? true : false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: globalVariables.textColor,
            width: 1,
          ),
        ),
        errorMaxLines: 3,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
      ),
    );
  }
}
