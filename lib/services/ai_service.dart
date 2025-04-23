import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/flashcard.dart';
import 'dart:convert';

part 'ai_service.g.dart';

class AIService {
  static const String _apiKey = 'AIzaSyDTiqwZKi40g7rD7ibjuJMiYClHWrAioOU';
  late final GenerativeModel _model;

  AIService() {
    _model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);
  }

  Future<String> generateSummary(String? content) async {
    try {
      final prompt =
          'Generate a concise summary of the following educational content in about 3-4 sentences: $content';
      final promptContent = Content.text(prompt);
      final response = await _model.generateContent(promptContent as Iterable<Content>);
      return response.text ?? 'Failed to generate summary.';
    } catch (e) {
      return 'Error generating summary: $e';
    }
  }

  Future<List<Flashcard>> generateFlashcards(String content) async {
    try {
      final prompt =
          'Generate 3 flashcards for studying the following educational content. Format as JSON with "question" and "answer" fields in an array: $content';
      final promptContent = Content.text(prompt);
      final response = await _model.generateContent(promptContent as Iterable<Content>);

      if (response.text != null) {
        final text = response.text!;

        // Extract JSON from the response
        final jsonStart = text.indexOf('[');
        final jsonEnd = text.lastIndexOf(']') + 1;

        if (jsonStart >= 0 && jsonEnd > jsonStart) {
          final jsonStr = text.substring(jsonStart, jsonEnd);

          try {
            final List<dynamic> flashcardsJson = jsonDecode(jsonStr);

            return flashcardsJson
                .map(
                  (json) => Flashcard(
                    id:
                        DateTime.now().millisecondsSinceEpoch.toString() +
                        flashcardsJson.indexOf(json).toString(),
                    question: json['question'],
                    answer: json['answer'],
                    isAIGenerated: true,
                  ),
                )
                .toList();
          } catch (e) {
            return [];
          }
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<String> answerQuestion(String question, String lessonContent) async {
    try {
      final prompt =
          'Based on the following educational content, answer this question: $question\n\nContent: $lessonContent';
      final content = Content.text(prompt);
      final response = await _model.generateContent(content as Iterable<Content>);
      return response.text ?? 'Failed to answer question.';
    } catch (e) {
      return 'Error answering question: $e';
    }
  }
}

@riverpod
AIService aiService(AIServiceRef ref) {
  return AIService();
}

class AIServiceRef {
}

@riverpod
Future<String> generateSummary(GenerateSummaryRef ref, String content) async {
  final aiService = ref.watch(aiServiceProvider);
  return aiService.generateSummary(content);
}

@riverpod
Future<List<Flashcard>> generateFlashcards(
  GenerateFlashcardsRef ref,
  String content,
) async {
  final aiService = ref.watch(aiServiceProvider);
  return aiService.generateFlashcards(content);
}

@riverpod
Future<String> answerQuestion(
  AnswerQuestionRef ref,
  String question,
  String lessonContent,
) async {
  final aiService = ref.watch(aiServiceProvider);
  return aiService.answerQuestion(question, lessonContent);
}
