import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:market_mate/utilities/globalVariables.dart';
import 'package:market_mate/widgets/customButton.dart';
import 'package:market_mate/widgets/customTextField.dart';
import 'package:market_mate/widgets/haveAccount.dart';

class SignUpPassword extends StatefulWidget {
  static const routeName = '/signUpPassword';

  const SignUpPassword({super.key});

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  GlobalVariables globalVariables = GlobalVariables();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
                                    CustomTextField(
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value!.length < 6) {
                                          return "Password must be at least 6 characters long.";
                                        }
                                        return null;
                                      },
                                      isObscure: true,
                                      controller: passwordController,
                                      hintText: 'Password',
                                      onTap: () {},
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      text: "Next",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         const BirthDateSignUp(),
                                          //   ),
                                          // );
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
