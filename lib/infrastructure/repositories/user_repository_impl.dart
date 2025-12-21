import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/repositories/user_repository.dart';
import 'package:daily_track/infrastructure/database/database.dart';

class UserRepositoryImpl implements UserRepository {
  final DailyTrackDatabase _dbManager;

  UserRepositoryImpl({ 
    required DailyTrackDatabase dbManager
  }) : _dbManager = dbManager;

  // Query on DB [Email && Password]
  @override
  Future<User?> login(String email, String password) async {
    try {
      final db = await _dbManager.database;
      
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
      throw Exception("Internal Error");
    }
  }

  // Query on DB [Email] for Sign Up Validation
  @override
  Future<bool> getUserByEmail(String email) async {
    try {
      final db = await _dbManager.database;

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
      throw Exception("Internal Error");
    }
  }

  // Add User on DB
  @override
  Future<void> addUser(User user) async {
    try {
      final db = await _dbManager.database;

      await db.insert(
        'users', 
        user.toJson(),
      );
    } catch(e) {
      throw Exception("Internal Error");
    }
  } 

  // Delete User from DB
  @override
  Future<void> deleteUser(String uuid) async {
    try {
      final db = await _dbManager.database;

      await db.delete(
        'users',
        where: 'uuid = ?',
        whereArgs: [uuid],
      );
    } catch(e) {
      throw Exception("Internal Error");
    }
  }

  // Update User on DB
  @override
  Future<void> updateUser(User user) async {
    try {
      final db = await _dbManager.database;

      await db.update(
        'users',
        user.toJson(),
        where: 'uuid = ?',
        whereArgs: [user.uuid],
      );
    } catch (e) {
      throw Exception("Internal Error");
    }
  }

}