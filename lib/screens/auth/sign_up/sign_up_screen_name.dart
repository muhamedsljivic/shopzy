import 'package:flutter/material.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_birthdate.dart';
import 'package:market_mate/utilities/globalVariables.dart';
import 'package:market_mate/widgets/customButton.dart';
import 'package:market_mate/widgets/customTextField.dart';
import 'package:market_mate/widgets/haveAccount.dart';

class SignUpName extends StatefulWidget {
  static const routeName = "/signUpName";
  const SignUpName({super.key});

  @override
  State<SignUpName> createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  GlobalVariables globalVariables = GlobalVariables();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateNameAndSurname(String? value) {
    String pattern =
        r'^[a-zA-ZšđćčžŠĐĆČŽ]+(([,. -][a-zA-ZšđćčžŠĐĆČŽ ])?[a-zA-ZšđćčžŠĐĆČŽ]*)*$';

    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Required field.';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid format.';
    } else if (value[0] == value[0].toLowerCase()) {
      return 'Must start with a capital letter.';
    }
    return null;
  }

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
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: CustomTextField(
                                            onChanged: (value) {},
                                            validator: validateNameAndSurname,
                                            controller: nameController,
                                            textCapitalization: true,
                                            hintText: 'Name',
                                            onTap: () {},
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: CustomTextField(
                                            onChanged: (value) {},
                                            validator: validateNameAndSurname,
                                            textCapitalization: true,
                                            controller: surnameController,
                                            hintText: 'Surname',
                                            onTap: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      text: "Next",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const BirthDateSignUp(),
                                            ),
                                          );
                                        }
                                      },
                                      backgroundColor:
                                          globalVariables.buttonColor,
                                      textColor: Colors.black,
                                      buttonWidth: double.infinity,
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
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
