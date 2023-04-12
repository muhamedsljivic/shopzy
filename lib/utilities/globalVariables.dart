// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlobalVariables {
  Color backgroundColor = const Color.fromARGB(235, 235, 235, 235);
  Color buttonColor = const Color.fromRGBO(192, 232, 98, 1);
  Color buttonTextColor = const Color.fromRGBO(13, 28, 46, 1);
  Color primaryColor = Colors.black;
  Color textColor = const Color.fromRGBO(91, 91, 91, 1);
  Color errorColor = const Color.fromRGBO(186, 26, 26, 1);
  Color genderColor = const Color.fromRGBO(17, 17, 34, 1);

  Widget welcomeImg = SvgPicture.asset('assets/images/register_img.svg');

  EdgeInsets paddingSignInSignUp = const EdgeInsets.only(left: 46, right: 46);
}
