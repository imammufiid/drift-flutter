import 'package:dartz/dartz.dart';
import 'package:drift_project/domain/model/user_model.dart';
import 'package:drift_project/domain/repository/user_repository.dart';
import 'package:drift_project/utils/error/failure_response.dart';
import 'package:drift_project/utils/use_case/use_case.dart';

class SaveUserUseCase extends UseCase<void, UserModel> {
  final UserRepository userRepository;

  SaveUserUseCase({required this.userRepository});

  @override
  Future<Either<FailureResponse, bool>> call(UserModel params) {
    return userRepository.save(params);
  }

}