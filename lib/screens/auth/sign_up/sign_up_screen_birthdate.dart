import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:market_mate/screens/auth/sign_up/sign_up_screen_gender.dart';
import 'package:market_mate/utilities/globalVariables.dart';
import 'package:market_mate/widgets/customButton.dart';
import 'package:market_mate/widgets/customTextField.dart';
import 'package:market_mate/widgets/haveAccount.dart';

class BirthDateSignUp extends StatefulWidget {
  static const routeName = '/birthDateSignUp';
  const BirthDateSignUp({super.key});

  @override
  State<BirthDateSignUp> createState() => _BirthDateSignUpState();
}

class _BirthDateSignUpState extends State<BirthDateSignUp> {
  GlobalVariables globalVariables = GlobalVariables();

  TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String dateAttribute = "";
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
                                        final DateTime eighteenYearsAgo =
                                            DateTime.now().subtract(
                                                const Duration(days: 18 * 365));

                                        int millisecondsPicked = 0;
                                        if (value!.isEmpty) {
                                          return "Required field.";
                                        }

                                        if (value.isNotEmpty) {
                                          DateFormat format =
                                              DateFormat("dd-MM-yyyy");

                                          DateTime parsedPickedDate =
                                              format.parse(
                                                  value.replaceAll(".", "-"));
                                          dateAttribute =
                                              "${parsedPickedDate.day < 10 ? "0${parsedPickedDate.day}" : "${parsedPickedDate.day}"}-${parsedPickedDate.month < 10 ? "0${parsedPickedDate.month}" : "${parsedPickedDate.month}"}-${parsedPickedDate.year}";
                                          millisecondsPicked = parsedPickedDate
                                              .millisecondsSinceEpoch;
                                        }

                                        if (eighteenYearsAgo
                                                .millisecondsSinceEpoch <
                                            millisecondsPicked) {
                                          return "Sorry, you must be at least 18 years old to use this app.";
                                        }

                                        return null;
                                      },
                                      controller: dateController,
                                      hintText: "Birth Date",
                                      readOnly: true,
                                      onTap: () async {
                                        DateFormat format =
                                            DateFormat("dd-MM-yyyy");
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: dateController
                                                  .text.isNotEmpty
                                              ? format.parse(dateController.text
                                                  .replaceAll(".", "-"))
                                              : DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2025),
                                        );
                                        if (pickedDate != null) {
                                          String formattedDate =
                                              format.format(pickedDate);
                                          dateController.text = formattedDate
                                              .replaceAll("-", ".");
                                        }
                                      },
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
                                                      const SignUpGender()));
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
