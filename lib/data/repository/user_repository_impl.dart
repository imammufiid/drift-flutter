import 'package:dartz/dartz.dart';
import 'package:drift_project/data/source/local/user_local_data_source.dart';
import 'package:drift_project/domain/mapper/user_mapper.dart';
import 'package:drift_project/domain/model/user_model.dart';
import 'package:drift_project/domain/repository/user_repository.dart';
import 'package:drift_project/utils/error/failure_response.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserMapper userMapper;

  UserRepositoryImpl({
    required this.userLocalDataSource,
    required this.userMapper,
  });

  @override
  Stream<List<UserModel>> getUsers() {
    return userLocalDataSource.getUsers().map((event) =>
        event.map((e) => UserModel(id: e.id, name: e.name)).toList());
  }

  @override
  Future<Either<FailureResponse, bool>> save(UserModel data) async {
    try {
      final result = await userLocalDataSource
          .save(userMapper.mapModelDomainToEntity(data));
      return Right(result);
    } catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
