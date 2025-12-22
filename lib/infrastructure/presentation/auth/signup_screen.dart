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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F1F5), Color(0xFFD4E7F0)],
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleComponent(title: "Sign Up Now"),
        
                const SizedBox(height: 5),
        
                SubtitleComponent(subtitle: "Please fill all the information."),
        
                const SizedBox(height: 25),
        
                TextFieldComponent(label: "Name"),
        
                const SizedBox(height: 10),
        
                TextFieldComponent(label: "Email"),
        
                const SizedBox(height: 10),
        
                TextFieldComponent(label: "Password"),
        
                const SizedBox(height: 10),
        
                ButtonComponent(message: "Sign Up", function: () => _signUp()),

                const SizedBox(height: 20),

                DividerComponent(),

                const SizedBox(height: 10),

                TextButtonComponent(message: "Log In", function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}