import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/course.dart';
import '../services/data_service.dart';

part 'course_provider.g.dart';

@riverpod
List<Course> coursesByDepartment(CoursesByDepartmentRef ref, String departmentId) {
  return DataService.getCoursesByDepartment(departmentId);
}

@riverpod
List<Course> tutorCourses(TutorCoursesRef ref) {
  return DataService.getTutorCourses();
}

@riverpod
class SelectedCourse extends _$SelectedCourse {
  @override
  Course? build() {
    return null;
  }

  void select(Course course) {
    state = course;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class EnrolledCourses extends _$EnrolledCourses {
  @override
  List<Course> build() {
    return [];
  }

  void enroll(Course course) {
    if (!state.any((c) => c.id == course.id)) {
      state = [...state, course];
    }
  }

  void unenroll(String courseId) {
    state = state.where((c) => c.id != courseId).toList();
  }
}
