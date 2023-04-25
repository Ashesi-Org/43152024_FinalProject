// ignore_for_file: unused_import

import 'package:final_project/Screens/Welcome/Components/login_helper_functions.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/Screens/Welcome/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/Welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBlyhG2iOS6xRXFzOTxmYTK2tqtEqLZXOM",
          appId: "1:1013844964044:web:f2fe83efa7abadb3cc8869",
          messagingSenderId: "1013844964044",
          projectId: "final-project-27f62"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
        child: MaterialApp(
          title: 'Flutter Auth',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: WelcomeScreen(),
        ));
  }
}
