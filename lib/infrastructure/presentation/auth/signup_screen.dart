import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/infrastructure/presentation/auth/auth_state.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/divider.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/subtitle.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_button.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/text_field.dart';
import 'package:daily_track/infrastructure/presentation/auth/components/title.dart';
import 'package:daily_track/infrastructure/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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

  // Navigate to Login
  void _navigateToLogin(bool replacement) {
    replacement 
      ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
      : Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    replacement ? null : context.read<AuthProvider>().clearErrors();
    setState(() {
      _controllerName.clear();
      _controllerEmail.clear();
      _controllerPassword.clear();
    });
  }

  Future<void> _signUp() async {
    final provider = context.read<AuthProvider>();

    final isValid = provider.validateSignUpFields(_controllerName.text, _controllerEmail.text, _controllerPassword.text);

    if(!isValid) return;

    final uuid = Uuid().v4();

    final user = User(uuid: uuid, name: _controllerName.text, email: _controllerEmail.text, password: _controllerPassword.text);

    await provider.addUser(user);
    _navigateToLogin(true);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

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
            TextFieldComponent(controller: _controllerName, label: "Name", error: provider.errorName),
        
            const SizedBox(height: 10),
        
            // Email Text Field
            TextFieldComponent(controller: _controllerEmail, label: "Email", error: provider.errorEmail),
        
            const SizedBox(height: 10),
        
            // Password Text Field
            TextFieldComponent(controller: _controllerPassword, label: "Password", error: provider.errorPassword),
        
            const SizedBox(height: 10),
        
            // Sign Up Button
            ButtonComponent(message: "Sign Up", function: () => _signUp()),
        
            const SizedBox(height: 20),
        
            // Divider
            DividerComponent(),
        
            const SizedBox(height: 10),
            
            // Navigate to Login Button
            TextButtonComponent(message: "Log In", function: () => _navigateToLogin(false)),
          ],
        ),
      ),
    );
  }
}