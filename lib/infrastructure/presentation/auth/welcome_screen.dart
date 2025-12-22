import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/subtitle.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/title.dart';
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
            // Icon
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.task, color: Colors.red, size: 50),
            ),

            const SizedBox(height: 20),

            // Title
            TitleComponent(title: "Welcome to Daily Track"),
        
            const SizedBox(height: 10),

            // Subtitle
            SubtitleComponent(subtitle: "Your app for mananing tracks."),
        
            const SizedBox(height: 20),

            // Get Started Button [Sign Up]
            ButtonComponent(message: "Get Started", function: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()))),
        
            // I already have an account Button [Login]
            TextButtonComponent(message: "I already have an account", function: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))),
          ],
        ),
      ),
    );
  }
}