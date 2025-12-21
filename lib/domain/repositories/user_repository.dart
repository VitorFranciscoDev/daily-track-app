import 'package:daily_track/domain/entities/user.dart';

abstract class UserRepository {
  Future<bool> getUserByEmail(String email);
  Future<User?> login(String email, String password);
  Future<void> addUser(User user);
  Future<void> deleteUser(String uuid);
  Future<void> updateUser(User user);
}