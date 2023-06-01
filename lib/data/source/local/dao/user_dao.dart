import 'package:drift/drift.dart';
import 'package:drift_project/data/model/entity/user_entity.dart';
import 'package:drift_project/data/source/local/db/app_database.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserEntity])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<void> save(UserEntityCompanion data) =>
      into(userEntity).insert(data, mode: InsertMode.insertOrReplace);

  Stream<List<UserEntityData>> watch() => select(userEntity).watch();
}
