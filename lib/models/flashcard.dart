class Flashcard {
  final String id;
  final String question;
  final String answer;
  final bool isAIGenerated;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    this.isAIGenerated = false,
  });
}
