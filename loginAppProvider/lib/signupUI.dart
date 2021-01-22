import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginAppProvider/signinUI.dart';
import 'package:loginAppProvider/validation/SignUpValidation/signUpValidationController.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final double sizedBoxHeight = 27.2;
  final double contentPaddingUnit = 16.0;
  final double borderRadius = 6.0;
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
                      topLeft: Radius.circular(1500),
                      topRight: Radius.circular(1500),
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
                        height: sizedBoxHeight + 4.5,
                      ),

                      /// [Full Name TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(contentPaddingUnit),
                            labelText: "Full Name",
                            // errorText: signUpValidator.fullName.error,
                            suffixIcon: Icon(Icons.person_pin_outlined),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                            signUpValidator.changeFullName(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizedBoxHeight,
                      ),

                      /// [Email Address TextField widget]
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(contentPaddingUnit),
                            labelText: "Email Address",
                            // errorText: "",
                            suffixIcon: Icon(Icons.email_outlined),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizedBoxHeight,
                      ),

                      /// [PhoneNo. TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(contentPaddingUnit),
                            labelText: "Phone No.",
                            // errorText: "",
                            suffixIcon: Icon(Icons.phone_enabled_outlined),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizedBoxHeight,
                      ),

                      /// [DOB TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          controller: signUpValidator.controller,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(contentPaddingUnit),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            hintText: "Enter DOB",
                            labelText: "dd-mm-yyyy",
                            // errorText: signUpValidator.dob.error,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.date_range_outlined),
                              onPressed: () {
                                signUpValidator.selectDate(context);
                              },
                            ),
                          ),
                          onChanged: (String value) => {
                            signUpValidator.changeDOB(value)
                            // TODO://Implement some functions here
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizedBoxHeight,
                      ),
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          /// [Password TextField widget]
                          obscureText: true,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(contentPaddingUnit),
                            labelText: "Password",
                            // errorText: "",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {},
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                          },
                        ),
                      ),

                      /// [Already have an account? TextButton]
                      TextButton(
                        child: Text(
                          "Already have an account? Login.",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        onPressed: () {
                          //redirecting to SignIN() page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                      ),

                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Consumer<SignUpController>(
                          builder: (_, signUpValidator, __) => ElevatedButton(
                            child: Text("Submit"),
                            onPressed: () {
                              // Submitting the data to some storage.
                              signUpValidator.submitData();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff00BFA6),
                              elevation: 0,
                              onPrimary: Colors.white,
                              side: BorderSide(
                                color: Colors.teal[300],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
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
