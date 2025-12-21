import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/repositories/user_repository.dart';
import 'package:daily_track/infrastructure/database/database.dart';

class UserRepositoryImpl implements UserRepository {
  final DailyTrackDatabase _dbManager;

  UserRepositoryImpl({ 
    required DailyTrackDatabase dbManager
  }) : _dbManager = dbManager;

  @override
  Future<void> addUser(User user) async {
    final db = await _dbManager.database;

    try {
      // Returns the index of the User
      await db.insert('users', user.toJson());
    } catch (e) {
      throw Exception("Error in Add User Repository: $e");
    }
  } 

  @override
  Future<void> deleteUser(String uuid) async {
    final db = await _dbManager.database;

    try {
      // Returns the number of rows affected
      await db.delete(
        'users',
        where: 'uuid = ?',
        whereArgs: [uuid],
      );
    } catch(e) {
      throw Exception("Error in Delete User Repository: $e");
    }
  }

  @override
  Future<void> updateUser(User user) async {
    final db = await _dbManager.database;

    try {
      // Returns the number of rows affected
      await db.update(
        'users',
        user.toJson(),
        where: 'uuid = ?',
        whereArgs: [user.uuid],
      );
    } catch (e) {
      throw Exception("Error in Update User Repository: $e");
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    final db = await _dbManager.database;

    try {
      // Receives User
      final result = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      if(result.isNotEmpty) {
        return User.fromJson(result.first);
      }

      return null;
    } catch(e) {
      throw Exception("Error in Do Login Repository: $e");
    }
  }

  @override
  Future<bool> getUserByEmail(String email) async {
    final db = await _dbManager.database;

    try {
      // Receives User
      final existingUser = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );

      if(existingUser.isNotEmpty) {
        return true;
      }

      return false;
    } catch(e) {
      throw Exception("Error in Get User By Email Repository: $e");
    }
  }

}