import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginAppProvider/signinUI.dart';
import 'package:loginAppProvider/validation/SignUpValidation/signUpValidationController.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final double _sizedBoxHeight = 27.2;
  final double _contentPaddingUnit = 16.0;
  final double _borderRadius = 6.0;
  final double _widgetContainerRadius = 1500;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (context) => SignUpController(),
        child: Stack(
          children: <Widget>[
            Container(
              /// [Image Container widget]
              height: 400 / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/SignUp.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: 300 / 2,
                ),
                Container(
                  /// [Form Container Widgets]

                  alignment: Alignment.bottomCenter,
                  padding:
                      EdgeInsets.only(top: 8, bottom: 32, left: 32, right: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // circular border radius only to toprigh and topleft.
                      topLeft: Radius.circular(_widgetContainerRadius),
                      topRight: Radius.circular(_widgetContainerRadius),
                    ),
                    color: Colors.teal[50],
                  ),
                  child: Column(
                    /// [Column Form widget]
                    children: <Widget>[
                      SizedBox(
                        height: 9.0,
                      ),
                      Text(
                        /// [Intro Text widget]
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: _sizedBoxHeight + 4.5,
                      ),

                      /// [Full Name TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            labelText: "Full Name",
                            // error message text
                            errorText: signUpValidator.fullName.error,
                            suffixIcon: Icon(Icons.person_pin_outlined),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            signUpValidator.changeFullName(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _sizedBoxHeight,
                      ),

                      /// [Email Address TextField widget]
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            labelText: "Email Address",
                            // error message text
                            errorText: signUpValidator.email.error,
                            suffixIcon: Icon(Icons.email_outlined),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            signUpValidator.isEmail(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _sizedBoxHeight,
                      ),

                      /// [PhoneNo. TextField widget]
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            labelText: "Phone No.",
                            // error message text
                            errorText: signUpValidator.phoneNum.error,
                            suffixIcon: Icon(Icons.phone_enabled_outlined),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            signUpValidator.isPhoneNum(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: _sizedBoxHeight,
                      ),

                      /// [DOB TextField widget]
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          controller: signUpValidator.controller,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                            hintText: "Enter DOB",
                            labelText: "dd-mm-yyyy",
                            // error message text
                            errorText: signUpValidator.dob.error,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.date_range_outlined),
                              onPressed: () {
                                signUpValidator.selectDate(context);
                              },
                            ),
                          ),
                          onChanged: (String value) => {
                            signUpValidator.changeDOB(value),
                          },
                        ),
                      ),
                      SizedBox(
                        height: _sizedBoxHeight,
                      ),
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          /// [Password TextField widget]

                          obscureText: signUpValidator.obscurePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            labelText: "Password",
                            // error message text
                            errorText: signUpValidator.password.error,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,

                                //if the obscurePassword = true, then show Grey Color
                                // else show some color.
                                // Enabling and disabling the color of the eye icon.
                                color: signUpValidator.obscurePassword
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                signUpValidator.togglePassword();
                              },
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            signUpValidator.isPassword(value);
                          },
                        ),
                      ),

                      /// [Already have an account? TextButton]
                      // TextButton(
                      //   child: Text(
                      //     "Already have an account? Login.",
                      //     style: TextStyle(
                      //       fontSize: 11,
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     //redirecting to SignIN() page
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SignIn(),
                      //       ),
                      //     );
                      //   },
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // TODO:// Put text of both the widgets little bit closer.
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 11),
                          ),
                          TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 11),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Consumer<SignUpController>(
                          builder: (_, signUpValidator, __) => ElevatedButton(
                            // a CONFIRM alert dialogue can be implemented here.
                            // As a parent widget of the Text widget.
                            child: Text("Submit"),
                            // if all the fields are filled then the submit button
                            // will be enabled else it will be disabled.
                            onPressed: signUpValidator.isValid
                                ? signUpValidator.submitData
                                : null,
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              elevation: 0,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_borderRadius),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
