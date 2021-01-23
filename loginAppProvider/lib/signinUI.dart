import 'package:flutter/material.dart';
import 'package:loginAppProvider/signupUI.dart';
import 'package:loginAppProvider/validation/SignInValidation/signInValidationController.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  final double _borderRadius = 6.0;
  final double _contentPaddingUnit = 18.0;
  final double _widgetContainerRadius = 300.0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (context) => SignInController(),
        child: Stack(
          children: [
            Container(
              /// [Image Container]
              height: 553 / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/Login.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  /// [Transparent Box Container]
                  height: 553 / 2,
                ),
                Container(
                  /// [Form Widgets]
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // circular border radius only to toprigh and topleft.
                      topLeft: Radius.circular(_widgetContainerRadius),
                      topRight: Radius.circular(_widgetContainerRadius),
                    ),
                    color: Colors.teal[50],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        /// [Sign In Widget]
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Consumer<SignInController>(
                        /// [Email Address Widget]
                        // Email address validation will partially be done on server-side.
                        builder: (_, signInValidator, __) => TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Email Address",
                            errorText: signInValidator.email.error,
                            suffixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            signInValidator.isEmail(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<SignInController>(
                        /// [Password Widget]
                        builder: (_, signInValidator, __) => TextField(
                          // Password validation will partially be done on server-side
                          obscureText: signInValidator.obscurePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(_contentPaddingUnit),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Password",
                            errorText: signInValidator.password.error,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: signInValidator.obscurePassword
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                signInValidator.togglePassword();
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius),
                            ),
                          ),
                          onChanged: (String value) {
                            signInValidator.isPassword(value);
                          },
                        ),
                      ),
                      GestureDetector(
                        /// [Forgot Password Widget]
                        /// This TextButton functionalities will be done on the server-side.
                        child: TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.redAccent,
                            ),
                          ),
                          // onPressed is nulled in order to disable the splash effect
                          // of the TextButton
                          onPressed: null,
                        ),
                        onTap: () {
                          // TODO://Implement forgot password method
                          // This method will be implemented on the server-side
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        /// [Login Button Widget]
                        height: 50,
                        width: double.infinity,

                        child: Consumer<SignInController>(
                          builder: (_, signInValidator, __) => ElevatedButton(
                            child: Text(
                              "Log In",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              elevation: 0,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_borderRadius),
                              ),
                            ),
                            onPressed: () {
                              signInValidator.submitData();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: TextButton.icon(
                          icon: Text(
                            "I am a new user.",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                          label: Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.teal,
                            ),
                          ),
                          onPressed: null,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
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
