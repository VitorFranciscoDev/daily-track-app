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