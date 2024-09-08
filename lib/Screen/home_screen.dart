
import 'package:flutter/material.dart';
import 'package:flutter_project/Services/authentication.dart';
import '../Widget/button.dart'; // Ensure this path is correct
import 'login.dart'; // Ensure this path is correct


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulations\nYou have successfully logged in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            MyButtons(
              onTap: () async {
                await AuthMethod().signOut(); // Use the signOut method from AuthMethod
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>  LoginScreen(),
                  ),
                );
              },
              text: "Log Out",
            ),
            // Uncomment to show user details
            // if (FirebaseAuth.instance.currentUser != null) ...[
            //   Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
            //   Text("${FirebaseAuth.instance.currentUser!.email}"),
            //   Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            // ],
          ],
        ),
      ),
    );
  }
}