import 'package:drift_project/app/main_app.dart';
import 'package:drift_project/di/injection.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injections().initialize();
  runApp(const MyApp());
}
