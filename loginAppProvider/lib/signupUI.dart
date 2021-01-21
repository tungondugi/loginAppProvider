import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginAppProvider/signinUI.dart';
import 'package:loginAppProvider/validation/SignUpValidation/signUpValidationController.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
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
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    /// [Column Form widget]
                    children: <Widget>[
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
                        height: 5,
                      ),

                      /// [Full Name TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            errorText: signUpValidator.fullName.error,
                            suffixIcon: Icon(Icons.person_pin_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                            signUpValidator.changeFullName(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// [Email Address TextField widget]
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            errorText: "",
                            suffixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// [PhoneNo. TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Phone No.",
                            errorText: "",
                            suffixIcon: Icon(Icons.phone_enabled_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onChanged: (String value) {
                            // TODO://Implement some functions here
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      /// [DOB TextField widget]
                      Consumer<SignUpController>(
                        builder: (context, signUpValidator, child) => TextField(
                          controller: signUpValidator.controller,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: "Enter DOB",
                            labelText: "dd-mm-yyyy",
                            errorText: signUpValidator.dob.error,
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
                        height: 5,
                      ),
                      Consumer<SignUpController>(
                        builder: (_, signUpValidator, __) => TextField(
                          /// [Password TextField widget]
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            errorText: "",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
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
                              // TODO://Implement some functions here
                              signUpValidator.submitData();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff00BFA6),
                              elevation: 0,
                              onPrimary: Colors.white,
                              side: BorderSide(
                                color: Colors.teal[300],
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
