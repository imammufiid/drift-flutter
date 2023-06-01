import 'package:drift_project/data/source/local/db/app_database.dart';

abstract class UserLocalDataSource {
  const UserLocalDataSource();

  Stream<List<UserEntityData>> getUsers();

  Future<bool> save(UserEntityCompanion data);
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final AppDatabase database;

  UserLocalDataSourceImpl({required this.database});

  @override
  Stream<List<UserEntityData>> getUsers() {
    return database.userDao.watch();
  }

  @override
  Future<bool> save(UserEntityCompanion data) async {
    try {
      await database.userDao.save(data);
      return true;
    } catch (error) {
      return false;
    }
  }
}
