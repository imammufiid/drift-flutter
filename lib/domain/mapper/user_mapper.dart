import 'package:drift/drift.dart';
import 'package:drift_project/data/source/local/db/app_database.dart';
import 'package:drift_project/domain/model/user_model.dart';

class UserMapper {
  UserEntityCompanion mapModelDomainToEntity(UserModel userModel) {
    return UserEntityCompanion(name: Value(userModel.name));
  }
}
