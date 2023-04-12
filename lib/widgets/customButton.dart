import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_mate/utilities/globalVariables.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double? buttonWidth;
  final Color? borderColor;
  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    super.key,
    required this.textColor,
    this.buttonWidth,
    this.borderColor,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  void dispose() {
    super.dispose();
  }

  GlobalVariables globalVariables = GlobalVariables();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonWidth,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 1,
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: widget.textColor),
        ),
      ),
    );
  }
}
