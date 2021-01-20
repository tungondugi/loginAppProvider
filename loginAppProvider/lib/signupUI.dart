import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            /// [Image Container widget]
            height: 520 / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/image/SignUp.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,

            /// [Form Container Widgets]
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
              /// [Column Form widget]
              children: <Widget>[
                SizedBox(
                  height: 10,
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
                  height: 36,
                ),
                TextField(
                  /// [Full Name TextField widget]
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    suffixIcon: Icon(Icons.person_pin_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  /// [Email Address TextField widget]
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    suffixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  /// [PhoneNo. TextField widget]
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Phone No.",
                    suffixIcon: Icon(Icons.phone_enabled_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  /// [DOB TextField widget]
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "dd-mm-yyyy",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.date_range_outlined),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  /// [Password TextField widget]
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
