import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            /// [Image Widget]
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/Login.png"),
                ),
              ),
            ),
          ),
          Container(
            /// [Form Widgets]
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                // circular border radius only to toprigh and topleft.
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.grey[100],
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
                TextField(
                  /// [Email Address Widget]
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  /// [Password Widget]
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                TextButton(
                  /// [Forgot Password Widget]
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 10),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  /// [Login Button Widget]
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  /// [New user? Widget]
                  "I'm a new user. Sign Up",
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
