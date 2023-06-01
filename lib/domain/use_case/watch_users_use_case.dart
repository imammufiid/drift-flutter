import 'package:dartz/dartz.dart';
import 'package:drift_project/domain/model/user_model.dart';
import 'package:drift_project/domain/repository/user_repository.dart';
import 'package:drift_project/utils/error/failure_response.dart';
import 'package:drift_project/utils/use_case/use_case.dart';

class WatchUsersUseCase extends UseCase<Stream<List<UserModel>>, NoParams> {
  final UserRepository userRepository;

  WatchUsersUseCase({required this.userRepository});

  @override
  Future<Either<FailureResponse, Stream<List<UserModel>>>> call(NoParams params) async {
    return Right(userRepository.getUsers());
  }

}