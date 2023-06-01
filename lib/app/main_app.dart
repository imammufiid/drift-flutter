import 'package:drift_project/presentation/home/bloc/home_cubit.dart';
import 'package:drift_project/presentation/home/home_page.dart';
import 'package:drift_project/presentation/profile/profile_page.dart';
import 'package:drift_project/utils/app_routes.dart';
import 'package:drift_project/utils/dependency/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        final argument = settings.arguments;
        switch (settings.name) {
          case AppRoutes.profile:
            return MaterialPageRoute(builder: (_) => const ProfilePage());
        }
        return null;
      },
      home: BlocProvider(
        create: (_) => HomeCubit(
          watchUsersUseCase: sl(),
          saveUserUseCase: sl(),
        ),
        child: const HomePage(),
      ),
    );
  }
}
