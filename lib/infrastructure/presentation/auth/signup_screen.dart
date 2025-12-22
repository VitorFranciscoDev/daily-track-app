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
  // Controllers
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  // Errors
  String? _errorName;
  String? _errorEmail;
  String? _errorPassword;

  // Name Validation
  void _validateName() => _controllerName.text.isEmpty 
    ? setState(() {
      _errorName = "Name cannot be blank";
    }) : _errorName = null;

  // Email Validation
  void _validateEmail() {
    setState(() {
      if(_controllerEmail.text.isEmpty) {
        _errorEmail = "Email cannot be blank";
      }

      if(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_controllerEmail.text)) {
        _errorEmail = "Email format invalid";
      }

      _errorEmail = null;
    });
  }

  // Password Validation
  void _validatePassword() {
    setState(() {
      if(_controllerPassword.text.isEmpty) {
        _errorPassword = "Password cannot be blank";
      }

      if(_controllerPassword.text.length < 8) {
        _errorPassword = "Password needs to have, at least, 8 characters";
      }

      _errorPassword = null;
    });
  }

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
            TextFieldComponent(controller: _controllerName, label: "Name", error: _errorName, function: () => _validateName()),
        
            const SizedBox(height: 10),
        
            // Email Text Field
            TextFieldComponent(controller: _controllerEmail, label: "Email", error: _errorEmail, function: () => _validateEmail()),
        
            const SizedBox(height: 10),
        
            // Password Text Field
            TextFieldComponent(controller: _controllerPassword, label: "Password", error: _errorPassword, function: () => _validatePassword()),
        
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