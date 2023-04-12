import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_password.dart';
import 'package:market_mate/utilities/globalVariables.dart';
import 'package:market_mate/widgets/customButton.dart';
import 'package:market_mate/widgets/customTextField.dart';
import 'package:market_mate/widgets/haveAccount.dart';

class SignUpEmail extends StatefulWidget {
  static const routeName = '/signUpEmail';

  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  GlobalVariables globalVariables = GlobalVariables();

  TextEditingController emailController = TextEditingController();

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
                                        if (value!.isEmpty) {
                                          return "Required field.";
                                        } else if (!EmailValidator.validate(
                                            value)) {
                                          return "Email invalid.";
                                        }
                                        return null;
                                      },
                                      controller: emailController,
                                      hintText: 'Email',
                                      onTap: () {},
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
                                                  const SignUpPassword(),
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
