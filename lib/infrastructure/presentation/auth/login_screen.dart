import 'package:daily_track/infrastructure/presentation/auth/auth_state.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/divider.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/subtitle.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_field.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/title.dart';
import 'package:daily_track/infrastructure/presentation/auth/signup_screen.dart';
import 'package:daily_track/infrastructure/presentation/bottom_navigator/bottom_navigator.dart';
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

  // Navigate to SignUp
  void _navigateToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
    context.read<AuthProvider>().clearErrors();
    setState(() {
      _controllerEmail.clear();
      _controllerPassword.clear();
    });
  }

  // Navigate to Bottom Navigator
  void _navigateToBottomNavigator() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigatorScreen()));
    setState(() {
      _controllerEmail.clear();
      _controllerPassword.clear();
    });
  }

  // Log In
  Future<void> _login() async {
    final provider = context.read<AuthProvider>();

    final isValid = provider.validateLoginFields(_controllerEmail.text, _controllerPassword.text);

    if(!isValid) return;

    final user = await provider.login(_controllerEmail.text, _controllerPassword.text);

    if(user != null) {
      _navigateToBottomNavigator();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

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
            TextFieldComponent(controller: _controllerEmail, label: "Email", error: provider.errorEmail),
        
            const SizedBox(height: 10),
        
            // Password Text Field
            TextFieldComponent(controller: _controllerPassword, label: "Password", error: provider.errorPassword),
        
            const SizedBox(height: 10),
        
            // Log In Button
            ButtonComponent(message: "Log In", function: () => _login()),
        
            const SizedBox(height: 20),
        
            // Divider
            DividerComponent(),
        
            const SizedBox(height: 10),
            
            // Navigate to Sign Up Button
            TextButtonComponent(message: "Sign Up", function: () =>  _navigateToSignUp()),
          ],
        ),
      ),
    );
  }
}