import 'package:drift_project/domain/use_case/save_user_use_case.dart';
import 'package:drift_project/domain/use_case/watch_users_use_case.dart';
import 'package:drift_project/utils/dependency/get_it.dart';

class DomainInjection {
  DomainInjection() {
    _registerUseCase();
  }

  _registerUseCase() {
    sl.registerLazySingleton<SaveUserUseCase>(
        () => SaveUserUseCase(userRepository: sl()));

    sl.registerLazySingleton<WatchUsersUseCase>(
        () => WatchUsersUseCase(userRepository: sl()));
  }
}
