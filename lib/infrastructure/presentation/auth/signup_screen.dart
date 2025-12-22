import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/divider.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/subtitle.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_field.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/title.dart';
import 'package:daily_track/infrastructure/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  Future<void> _signUp() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            TitleComponent(title: "Sign Up Now"),
        
            const SizedBox(height: 5),
        
            // Subtitle
            SubtitleComponent(subtitle: "Please fill all the information."),
        
            const SizedBox(height: 25),
        
            // Name Text Field
            TextFieldComponent(label: "Name"),
        
            const SizedBox(height: 10),
        
            // Email Text Field
            TextFieldComponent(label: "Email"),
        
            const SizedBox(height: 10),
        
            // Password Text Field
            TextFieldComponent(label: "Password"),
        
            const SizedBox(height: 10),
        
            // Sign Up Button
            ButtonComponent(message: "Sign Up", function: () => _signUp()),
        
            const SizedBox(height: 20),
        
            // Divider
            DividerComponent(),
        
            const SizedBox(height: 10),
            
            // Navigate to Login Button
            TextButtonComponent(message: "Log In", function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))),
          ],
        ),
      ),
    );
  }
}