import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/usecases/user_usecases.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final UserUseCases _useCases;

  AuthProvider({
    required UserUseCases useCases,
  }) : _useCases = useCases;

  User? _user;
  User? get user => _user;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorName;
  String? _errorEmail;
  String? _errorPassword;

  String? get errorName => _errorName;
  String? get errorEmail => _errorEmail;
  String? get errorPassword => _errorPassword;

  bool validateSignUpFields(String name, String email, String password) {
    name.isEmpty ? _errorName = "Name cannot be blank" : _errorName = null;
    
    if(email.isEmpty) {
      _errorEmail = "Email cannot be blank";
    } else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _errorEmail = "Email format invalid";
    } else {
      _errorEmail = null;
    }

    if(password.isEmpty) {
      _errorPassword = "Password cannot be blank";
    } else if(password.length < 8) {
      _errorPassword = "Password needs to have, at least, 8 characters";
    } else {
      _errorPassword = null;
    }
    
    notifyListeners();
    
    return _errorName == null && _errorEmail == null && _errorPassword == null;
  }

  bool validateLoginFields(String email, String password) {
    if(email.isEmpty) {
      _errorEmail = "Email cannot be blank";
    } else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _errorEmail = "Email format invalid";
    } else {
      _errorEmail = null;
    }

    if(password.isEmpty) {
      _errorPassword = "Password cannot be blank";
    } else if(password.length < 8) {
      _errorPassword = "Password needs to have, at least, 8 characters";
    } else {
      _errorPassword = null;
    }
    
    notifyListeners();
    
    return _errorEmail == null && _errorPassword == null;
  }

  void clearErrors() {
    _errorName = null;
    _errorEmail = null;
    _errorPassword = null;

    notifyListeners();
  }

  Future<User?> login(String email, String password) async {
    return await _useCases.login(email, password);
  }

  Future<void> addUser(User user) async {
    return await _useCases.addUser(user);
  }

  Future<void> deleteUser(String uuid) async {
    return await _useCases.deleteUser(uuid);
  }

  Future<void> updateUser(User user) async {
    return await _useCases.updateUser(user);
  }
}