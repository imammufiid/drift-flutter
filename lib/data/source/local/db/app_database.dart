import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift_project/data/model/entity/user_entity.dart';
import 'package:drift_project/data/source/local/dao/user_dao.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [UserEntity], daos: [UserDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}

QueryExecutor _openConnection() {
  return SqfliteQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    logStatements: true,
  );
}