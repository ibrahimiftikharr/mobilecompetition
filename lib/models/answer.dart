import 'user.dart';

class Answer {
  final String id;
  final String answer;
  final User answeredBy;
  final DateTime answeredAt;

  Answer({
    required this.id,
    required this.answer,
    required this.answeredBy,
    required this.answeredAt,
  });
}
