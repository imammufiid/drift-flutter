import 'package:drift_project/data/repository/user_repository_impl.dart';
import 'package:drift_project/data/source/local/db/app_database.dart';
import 'package:drift_project/data/source/local/user_local_data_source.dart';
import 'package:drift_project/domain/mapper/user_mapper.dart';
import 'package:drift_project/domain/repository/user_repository.dart';
import 'package:drift_project/utils/dependency/get_it.dart';

class DataInjection {
  DataInjection() {
    _registerCore();
    _registerLocalDataSource();
    _registerRemoteDataSource();
    _registerMapper();
    _registerRepository();
  }

  _registerCore() {
    sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  }

  _registerLocalDataSource() {
    sl.registerLazySingleton<UserLocalDataSource>(
        () => UserLocalDataSourceImpl(database: sl()));
  }

  _registerRemoteDataSource() {}

  _registerRepository() {
    sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(userLocalDataSource: sl(), userMapper: sl()));
  }

  _registerMapper() {
    sl.registerLazySingleton<UserMapper>(() => UserMapper());
  }
}
