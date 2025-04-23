import 'user.dart';
import 'answer.dart';

class QA {
  final String id;
  final String question;
  final User askedBy;
  final DateTime askedAt;
  final List<Answer> answers;

  QA({
    required this.id,
    required this.question,
    required this.askedBy,
    required this.askedAt,
    this.answers = const [],
  });
}
