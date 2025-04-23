import 'flashcard.dart';
import 'qa.dart';

class Lesson {
  final String id;
  final String title;
  final String? textContent;
  final String? imageUrl;
  final String? fileUrl;
  final String? summary;
  final int readTime;
  final bool isCompleted;
  final List<Flashcard> flashcards;
  final List<QA> qaThread;

  Lesson({
    required this.id,
    required this.title,
    this.textContent,
    this.imageUrl,
    this.fileUrl,
    this.summary,
    required this.readTime,
    this.isCompleted = false,
    this.flashcards = const [],
    this.qaThread = const [],
  });
}
