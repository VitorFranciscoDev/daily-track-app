import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/repositories/user_repository.dart';

class UserUseCases {
  final UserRepository _repository;

  UserUseCases({
    required UserRepository repository,
  }) : _repository = repository;

  // Validation
  void _validate(String variable, String name) => variable.isEmpty ? throw Exception("Invalid $name") : null;
  void _validateID(int id) => id <= 0 ? throw Exception("Invalid ID") : null;
  void _validateEmail(String email) => email.isEmpty ? throw Exception("") : null;
  void _validatePassword(String password) => password.length < 8 ? throw Exception("Invalid Password") : null;

  // Get User By Email [Validation for Sign Up]
  Future<bool> getUserByEmail(String email) async {
    _validateEmail(email);

    return await _repository.getUserByEmail(email);
  }

  // Login
  Future<User?> login(String email, String password) async {
    _validateEmail(email);
    _validatePassword(password);

    return await _repository.login(email, password);
  }

  // Sign Up
  Future<void> addUser(User user) async {
    _validate(user.uuid, "UUID");
    _validate(user.name, "Name");
    _validateEmail(user.email);
    _validatePassword(user.password);

    await _repository.addUser(user);
  }

  // Delete User from DB
  Future<void> deleteUser(String uuid) async {
    _validate(uuid, "UUID");

    await _repository.deleteUser(uuid);
  }

  // Update User in DB
  Future<void> updateUser(User user) async {
    _validateID(user.id!);
    _validate(user.uuid, "UUID");
    _validate(user.name, "Name");
    _validateEmail(user.email);
    _validatePassword(user.password);

    await _repository.updateUser(user);
  }
}