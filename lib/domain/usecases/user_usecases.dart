import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/repositories/user_repository.dart';

class UserUseCase {
  UserUseCase({ required this.userRepository });

  final UserRepository userRepository;

  Future<void> getUserByEmail(String email) async {
    try {
      await userRepository.getUserByEmail(email);
    } catch(e) {
      throw Exception("Error in Get User By Email Use Case: $e");
    } 
  }

  Future<void> login(String email, String password) async {
    try {
      await userRepository.login(email, password);
    } catch(e) {
      throw Exception("Error in Do Login Use Case: $e");
    }
  }

  Future<void> addUser(User user) async {
    try {
      await userRepository.addUser(user);
    } catch (e) {
      throw Exception("Error in Add User Use Case: $e");
    }
  }

  Future<void> deleteUser(String uuid) async {
    try {
      await userRepository.deleteUser(uuid);
    } catch(e) {
      throw Exception("Error in Delete User Use Case: $e");
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await userRepository.updateUser(user);
    } catch(e) {
      throw Exception("Error in Update User Use Case: $e");
    }
  }
}