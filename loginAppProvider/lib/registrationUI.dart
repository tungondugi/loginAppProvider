import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Image.asset(
                "assets/image/welcome.png",
              ),
            ),
            Text(""),
            ElevatedButton(
              child: Text("Log In"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("Sign Up"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
