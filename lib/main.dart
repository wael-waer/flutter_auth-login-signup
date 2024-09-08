import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/Screen/home_screen.dart';
import 'package:flutter_project/Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home:StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapchot) {
        if (snapchot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      }
      
      ),
      
    );
  }
}




  