import 'package:flutter/material.dart';
import 'package:loginAppProvider/signinUI.dart';
// import 'package:loginAppProvider/signinUI.dart';
// import 'package:loginAppProvider/registrationUI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Creating a custom swatch
  final MaterialColor customTealColor = MaterialColor(
    0xff00BFA6,
    const <int, Color>{
      50: Color(0xff00BFA6),
      100: Color(0xff00BFA6),
      200: Color(0xff00BFA6),
      300: Color(0xff00BFA6),
      400: Color(0xff00BFA6),
      500: Color(0xff00BFA6),
      600: Color(0xff00BFA6),
      700: Color(0xff00BFA6),
      800: Color(0xff00BFA6),
      900: Color(0xff00BFA6),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customTealColor,
        primaryColor: customTealColor,
        disabledColor: Colors.grey,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: Registration(),
      home: SignIn(),
      // home: SignUp(),
    );
  }
}
