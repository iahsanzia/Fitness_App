// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/BMIcalculator.dart';
import 'package:first_app/screens/StepCounter.dart';
import 'package:first_app/screens/homescreen.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/register.dart';
import 'package:first_app/screens/weatherscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-n-SiYcd5ufw6RoMO-6cJVMKfELbnziQ",
            authDomain: "first-app-3fc2b.firebaseapp.com",
            projectId: "first-app-3fc2b",
            storageBucket: "first-app-3fc2b.appspot.com",
            messagingSenderId: "941768087830",
            appId: "1:941768087830:web:4f66a11308f97f0238d837"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const first_app());
}

class first_app extends StatelessWidget {
  const first_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        "/": (context) => HomeScreen(),
        "//": (context) => BMIscreen(),
        "weather": (context) => Weatherscreen(),
        "stepcounter": (context) => StepCounterScreen(),
      },
      initialRoute: "register",
    );
  }
}
