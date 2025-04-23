import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/lesson.dart';
import '../models/flashcard.dart';
import '../services/ai_service.dart';

part 'lesson_provider.g.dart';

@riverpod
class SelectedLesson extends _$SelectedLesson {
  @override
  Lesson? build() {
    return null;
  }

  void select(Lesson lesson) {
    state = lesson;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class LessonProgress extends _$LessonProgress {
  @override
  Map<String, bool> build() {
    return {};
  }

  void markAsCompleted(String lessonId) {
    state = {...state, lessonId: true};
  }

  void markAsIncomplete(String lessonId) {
    final newState = Map<String, bool>.from(state);
    newState.remove(lessonId);
    state = newState;
  }

  bool isCompleted(String lessonId) {
    return state[lessonId] ?? false;
  }
}

@riverpod
class UserFlashcards extends _$UserFlashcards {
  @override
  Map<String, List<Flashcard>> build() {
    return {};
  }

  void addFlashcard(String lessonId, Flashcard flashcard) {
    final currentFlashcards = state[lessonId] ?? [];
    state = {
      ...state,
      lessonId: [...currentFlashcards, flashcard],
    };
  }

  void removeFlashcard(String lessonId, String flashcardId) {
    final currentFlashcards = state[lessonId] ?? [];
    state = {
      ...state,
      lessonId: currentFlashcards.where((f) => f.id != flashcardId).toList(),
    };
  }

  List<Flashcard> getFlashcards(String lessonId) {
    return state[lessonId] ?? [];
  }
}

@riverpod
Future<List<Flashcard>> lessonFlashcards(
  LessonFlashcardsRef ref,
  Lesson lesson,
) async {
  final userFlashcards = ref.watch(userFlashcardsProvider)[lesson.id] ?? [];

  if (lesson.textContent != null &&
      lesson.textContent!.isNotEmpty &&
      lesson.flashcards.isEmpty) {
    // Generate flashcards if none exist and we have content
    final generatedFlashcards = await ref.watch(
      generateFlashcardsProvider(lesson.textContent!).future,
    );
    return [...userFlashcards, ...generatedFlashcards];
  }

  return [...userFlashcards, ...lesson.flashcards];
}

@riverpod
Future<String> lessonSummary(LessonSummaryRef ref, Lesson lesson) async {
  if (lesson.summary != null) {
    return lesson.summary!;
  }

  if (lesson.textContent != null && lesson.textContent!.isNotEmpty) {
    return ref.watch(generateSummaryProvider(lesson.textContent!).future);
  }

  return "No content available to generate summary.";
}
