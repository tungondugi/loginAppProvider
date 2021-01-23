import 'package:flutter/material.dart';
import 'package:loginAppProvider/signupUI.dart';

class SignIn extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
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
                    topLeft: Radius.circular(300),
                    topRight: Radius.circular(300),
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
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Email Address",
                        suffixIcon: Icon(Icons.email_outlined),
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

                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye_outlined),
                          onPressed: null,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    GestureDetector(
                      /// [Forgot Password Widget]
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
                      },
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
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00BFA6),
                          elevation: 0,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          // TODO://Implement some functions here
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TextButton(
                    //   /// [New user? Widget]
                    //   child: Text(
                    //     "I'm a new user. Sign Up",
                    //     textAlign: TextAlign.center,
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => SignUp(),
                    //       ),
                    //     );
                    //   },
                    // ),
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
    );
  }
}
