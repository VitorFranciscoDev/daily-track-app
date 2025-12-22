import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_field.dart';
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
                const Text(
                  "Sign Up Now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 22,
                  ),
                ),
        
                const SizedBox(height: 5),
        
                const Text(
                  "Please fill all the information.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
        
                const SizedBox(height: 25),
        
                TextFieldComponent(),
        
                const SizedBox(height: 10),
        
                TextFieldComponent(),
        
                const SizedBox(height: 10),
        
                TextFieldComponent(),
        
                const SizedBox(height: 10),
        
                ButtonComponent(message: "Sign Up", function: () => _signUp()),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    const SizedBox(width: 15),
                    const Text("or", style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 15),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())), 
                  child: const Text("Log In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}