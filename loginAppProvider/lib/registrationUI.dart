import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class Registration extends StatelessWidget {
  Widget build(BuildContext context) {
    // This will hide the status bar and the bottom bar
    // SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/welcome.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          onPrimary: Colors.teal,
                          side: BorderSide(
                            color: Colors.teal[300],
                          )),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
