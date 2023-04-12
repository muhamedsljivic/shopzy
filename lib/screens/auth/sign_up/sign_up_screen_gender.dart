import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_birthdate.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_email.dart';
import 'package:market_mate/utilities/globalVariables.dart';
import 'package:market_mate/widgets/customButton.dart';
import 'package:market_mate/widgets/haveAccount.dart';

class SignUpGender extends StatefulWidget {
  static const routeName = "/signUpGender";
  const SignUpGender({super.key});

  @override
  State<SignUpGender> createState() => _SignUpGenderState();
}

class _SignUpGenderState extends State<SignUpGender> {
  GlobalVariables globalVariables = GlobalVariables();

  int _value = 0;
  bool nextClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  color: globalVariables.backgroundColor,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            globalVariables.welcomeImg,
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: globalVariables.paddingSignInSignUp,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color:
                                        const Color.fromRGBO(224, 224, 224, 1),
                                    height: MediaQuery.of(context).size.height *
                                        0.26,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Male",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  color: globalVariables
                                                      .genderColor,
                                                ),
                                              ),
                                              Transform.scale(
                                                scale: 1.1,
                                                child: Radio(
                                                  value: 1,
                                                  groupValue: _value,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _value = value!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Female",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  color: globalVariables
                                                      .genderColor,
                                                ),
                                              ),
                                              Transform.scale(
                                                scale: 1.1,
                                                child: Radio(
                                                  value: 2,
                                                  groupValue: _value,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _value = value!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rather not say",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  color: globalVariables
                                                      .genderColor,
                                                ),
                                              ),
                                              Transform.scale(
                                                scale: 1.1,
                                                child: Radio(
                                                  value: 3,
                                                  groupValue: _value,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _value = value!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (_value == 0 && nextClicked)
                                    Text(
                                      'Please select an option',
                                      style: GoogleFonts.roboto(
                                          color: globalVariables.errorColor),
                                    ),
                                  const SizedBox(height: 25),
                                  CustomButton(
                                    text: "Next",
                                    onPressed: () {
                                      setState(() {
                                        nextClicked = true;
                                      });
                                      if (_value != 0) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpEmail(),
                                          ),
                                        );
                                      }
                                    },
                                    backgroundColor:
                                        globalVariables.buttonColor,
                                    textColor: Colors.black,
                                    buttonWidth: double.infinity,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HaveAccount()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
