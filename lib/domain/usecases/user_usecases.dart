import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/repositories/user_repository.dart';

class AuthUseCase {
  final UserRepository _repository;

  AuthUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  Future<bool> getUserByEmail(String email) async {
    if(email.isEmpty) {
      throw Exception("Invalid Email");
    }

    return await _repository.getUserByEmail(email);
  }

  Future<User?> login(String email, String password) async {
    if(email.isEmpty) {
      throw Exception("Invalid Email");
    }

    if(password.length < 8) {
      throw Exception("Invalid Password");
    }

    return await _repository.login(email, password);
  }

  Future<void> addUser(User user) async {
    if(user.uuid.isEmpty) {
      throw Exception("Invalid UUID");
    }

    if(user.name.length < 3) {
      throw Exception("Invalid Name");
    }

    if(user.email.isEmpty) {
      throw Exception("Invalid Email");
    }

    if(user.password.length < 8) {
      throw Exception("Invalid Password");
    }

    await _repository.addUser(user);
  }

  Future<void> deleteUser(String uuid) async {
    if(uuid.isEmpty) {
      throw Exception("Invalid UUID");
    }

    await _repository.deleteUser(uuid);
  }

  Future<void> updateUser(User user) async {
    if(user.id! < 0) {
      throw Exception("Invalid ID");
    }
    
    if(user.uuid.isEmpty) {
      throw Exception("Invalid UUID");
    }

    if(user.name.length < 3) {
      throw Exception("Invalid Name");
    }

    if(user.email.isEmpty) {
      throw Exception("Invalid Email");
    }

    if(user.password.length < 8) {
      throw Exception("Invalid Password");
    }

    await _repository.updateUser(user);
  }
}