import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;

  const UserModel({this.id = 0, this.name = ""});

  @override
  List<Object?> get props => [id, name];
}
