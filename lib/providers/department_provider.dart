import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/department.dart';
import '../services/data_service.dart';

part 'department_provider.g.dart';

@riverpod
List<Department> departments(DepartmentsRef ref) {
  return DataService.getDepartments();
}

@riverpod
class SelectedDepartment extends _$SelectedDepartment {
  @override
  Department? build() {
    return null;
  }

  void select(Department department) {
    state = department;
  }

  void clear() {
    state = null;
  }
}
