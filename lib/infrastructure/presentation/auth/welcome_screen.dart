import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/login_screen.dart';
import 'package:daily_track/infrastructure/presentation/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Daily Track!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
        
            const SizedBox(height: 10),
        
            const Text(
              "Your app for mananing tracks.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
        
            const SizedBox(height: 20),
        
            ButtonComponent(message: "Get Started", function: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()))),
        
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())), 
              child: const Text(
                "I already have an account.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}