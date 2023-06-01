import 'package:bloc/bloc.dart';
import 'package:drift_project/domain/model/user_model.dart';
import 'package:drift_project/domain/use_case/save_user_use_case.dart';
import 'package:drift_project/domain/use_case/watch_users_use_case.dart';
import 'package:drift_project/utils/error/failure_response.dart';
import 'package:drift_project/utils/use_case/use_case.dart';
import 'package:drift_project/utils/view_data_state.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WatchUsersUseCase watchUsersUseCase;
  final SaveUserUseCase saveUserUseCase;

  HomeCubit({
    required this.watchUsersUseCase,
    required this.saveUserUseCase,
  }) : super(
          HomeState(
            homeState: ViewData.initial(),
            saveUserState: ViewData.initial(),
          ),
        );

  saveUser(UserModel data) async {
    final result = await saveUserUseCase.call(data);
    result.fold(
      (failure) => _onSaveFailure(failure),
      (data) => _onSaveSuccess(data),
    );
  }

  getUsers() async {
    final result = await watchUsersUseCase.call(const NoParams());
    result.fold((failure) {
      print(failure);
    }, (data) {
      data.listen((event) {
        print("Refresh......");
        print(event);
        emit(state.copyWith(homeState: ViewData.loaded(data: event)));
      });
    });
  }

  _onSaveFailure(FailureResponse failure) {
    emit(state.copyWith(
        saveUserState: ViewData.error(
      message: failure.errorMessage,
      failure: failure,
    )));
  }

  _onSaveSuccess(bool data) {
    emit(state.copyWith(saveUserState: ViewData.loaded(data: data)));
  }
}
