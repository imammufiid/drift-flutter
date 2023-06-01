import 'package:drift_project/data/di/data_injection.dart';
import 'package:drift_project/domain/di/domain_injection.dart';

class Injections {
  initialize() {
    DataInjection();
    DomainInjection();
  }
}
