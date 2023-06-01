part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ViewData<List<UserModel>> homeState;
  final ViewData<bool> saveUserState;

  const HomeState({
    required this.homeState,
    required this.saveUserState,
  });

  HomeState copyWith({
    ViewData<List<UserModel>>? homeState,
    ViewData<bool>? saveUserState,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      saveUserState: saveUserState ?? this.saveUserState,
    );
  }

  @override
  List<Object?> get props => [homeState, saveUserState];
}
