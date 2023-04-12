// ignore: file_names
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have an account? ",
          style:
              GoogleFonts.roboto(color: const Color.fromRGBO(133, 133, 133, 1)),
        ),
        InkWell(
          child: Text(
            "Login",
            style:
                GoogleFonts.roboto(color: const Color.fromRGBO(13, 28, 46, 1)),
          ),
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
