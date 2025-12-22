import 'package:daily_track/infrastructure/presentation/auth/auth_state.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/divider.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/subtitle.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_field.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/title.dart';
import 'package:daily_track/infrastructure/presentation/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  // Errors
  String? _errorEmail = "";
  String? _errorPassword = "";

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

  // Log In
  Future<void> _login() async {
    final _provider = context.read<AuthProvider>();

    if(_errorEmail == null && _errorPassword == null) {
      try {
        await _provider.login(_controllerEmail.text, _controllerPassword.text);
      } catch(e) {
        print("a");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            TitleComponent(title: "Log In"),
        
            const SizedBox(height: 5),
        
            // Subtitle
            SubtitleComponent(subtitle: "Please fill all the information."),
        
            const SizedBox(height: 25),
        
            // Email Text Field
            TextFieldComponent(controller: _controllerEmail, label: "Email", error: _errorEmail, function: () => _validateEmail()),
        
            const SizedBox(height: 10),
        
            // Password Text Field
            TextFieldComponent(controller: _controllerPassword, label: "Password", error: _errorPassword, function: () => _validatePassword()),
        
            const SizedBox(height: 10),
        
            // Log In Button
            ButtonComponent(message: "Log In", function: () => _login()),
        
            const SizedBox(height: 20),
        
            // Divider
            DividerComponent(),
        
            const SizedBox(height: 10),
            
            // Navigate to Sign Up Button
            TextButtonComponent(message: "Sign Up", function: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()))),
          ],
        ),
      ),
    );
  }
}