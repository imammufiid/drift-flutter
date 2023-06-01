import 'package:dartz/dartz.dart';
import 'package:drift_project/domain/model/user_model.dart';
import 'package:drift_project/utils/error/failure_response.dart';

abstract class UserRepository {
  const UserRepository();

  Stream<List<UserModel>> getUsers();
  Future<Either<FailureResponse, bool>> save(UserModel data);
}
