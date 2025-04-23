import 'lesson.dart';
import 'tutor.dart';
import 'user.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String coverUrl;
  final Tutor tutor;
  final List<User> enrolledStudents;
  final List<Lesson> lessons;
  final double progress;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.tutor,
    required this.enrolledStudents,
    required this.lessons,
    this.progress = 0.0,
  });
}
