// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lessonFlashcardsHash() => r'd7f850ad3d67456c4caaa45d4e93988ff903b9e1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [lessonFlashcards].
@ProviderFor(lessonFlashcards)
const lessonFlashcardsProvider = LessonFlashcardsFamily();

/// See also [lessonFlashcards].
class LessonFlashcardsFamily extends Family<AsyncValue<List<Flashcard>>> {
  /// See also [lessonFlashcards].
  const LessonFlashcardsFamily();

  /// See also [lessonFlashcards].
  LessonFlashcardsProvider call(Lesson lesson) {
    return LessonFlashcardsProvider(lesson);
  }

  @override
  LessonFlashcardsProvider getProviderOverride(
    covariant LessonFlashcardsProvider provider,
  ) {
    return call(provider.lesson);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lessonFlashcardsProvider';
}

/// See also [lessonFlashcards].
class LessonFlashcardsProvider
    extends AutoDisposeFutureProvider<List<Flashcard>> {
  /// See also [lessonFlashcards].
  LessonFlashcardsProvider(Lesson lesson)
    : this._internal(
        (ref) => lessonFlashcards(ref as LessonFlashcardsRef, lesson),
        from: lessonFlashcardsProvider,
        name: r'lessonFlashcardsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$lessonFlashcardsHash,
        dependencies: LessonFlashcardsFamily._dependencies,
        allTransitiveDependencies:
            LessonFlashcardsFamily._allTransitiveDependencies,
        lesson: lesson,
      );

  LessonFlashcardsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lesson,
  }) : super.internal();

  final Lesson lesson;

  @override
  Override overrideWith(
    FutureOr<List<Flashcard>> Function(LessonFlashcardsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonFlashcardsProvider._internal(
        (ref) => create(ref as LessonFlashcardsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lesson: lesson,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Flashcard>> createElement() {
    return _LessonFlashcardsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonFlashcardsProvider && other.lesson == lesson;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lesson.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LessonFlashcardsRef on AutoDisposeFutureProviderRef<List<Flashcard>> {
  /// The parameter `lesson` of this provider.
  Lesson get lesson;
}

class _LessonFlashcardsProviderElement
    extends AutoDisposeFutureProviderElement<List<Flashcard>>
    with LessonFlashcardsRef {
  _LessonFlashcardsProviderElement(super.provider);

  @override
  Lesson get lesson => (origin as LessonFlashcardsProvider).lesson;
}

String _$lessonSummaryHash() => r'83405c2348da7c9d084664ddb50c6f6da6d27441';

/// See also [lessonSummary].
@ProviderFor(lessonSummary)
const lessonSummaryProvider = LessonSummaryFamily();

/// See also [lessonSummary].
class LessonSummaryFamily extends Family<AsyncValue<String>> {
  /// See also [lessonSummary].
  const LessonSummaryFamily();

  /// See also [lessonSummary].
  LessonSummaryProvider call(Lesson lesson) {
    return LessonSummaryProvider(lesson);
  }

  @override
  LessonSummaryProvider getProviderOverride(
    covariant LessonSummaryProvider provider,
  ) {
    return call(provider.lesson);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lessonSummaryProvider';
}

/// See also [lessonSummary].
class LessonSummaryProvider extends AutoDisposeFutureProvider<String> {
  /// See also [lessonSummary].
  LessonSummaryProvider(Lesson lesson)
    : this._internal(
        (ref) => lessonSummary(ref as LessonSummaryRef, lesson),
        from: lessonSummaryProvider,
        name: r'lessonSummaryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$lessonSummaryHash,
        dependencies: LessonSummaryFamily._dependencies,
        allTransitiveDependencies:
            LessonSummaryFamily._allTransitiveDependencies,
        lesson: lesson,
      );

  LessonSummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lesson,
  }) : super.internal();

  final Lesson lesson;

  @override
  Override overrideWith(
    FutureOr<String> Function(LessonSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonSummaryProvider._internal(
        (ref) => create(ref as LessonSummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lesson: lesson,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _LessonSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonSummaryProvider && other.lesson == lesson;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lesson.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LessonSummaryRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `lesson` of this provider.
  Lesson get lesson;
}

class _LessonSummaryProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with LessonSummaryRef {
  _LessonSummaryProviderElement(super.provider);

  @override
  Lesson get lesson => (origin as LessonSummaryProvider).lesson;
}

String _$selectedLessonHash() => r'62f230f702e2e7c8e541d1107a225a76ca156935';

/// See also [SelectedLesson].
@ProviderFor(SelectedLesson)
final selectedLessonProvider =
    AutoDisposeNotifierProvider<SelectedLesson, Lesson?>.internal(
      SelectedLesson.new,
      name: r'selectedLessonProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedLessonHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedLesson = AutoDisposeNotifier<Lesson?>;
String _$lessonProgressHash() => r'6f8f1497d91b61ad9ecd9b981c24ed3c6fb8a28f';

/// See also [LessonProgress].
@ProviderFor(LessonProgress)
final lessonProgressProvider =
    AutoDisposeNotifierProvider<LessonProgress, Map<String, bool>>.internal(
      LessonProgress.new,
      name: r'lessonProgressProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$lessonProgressHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LessonProgress = AutoDisposeNotifier<Map<String, bool>>;
String _$userFlashcardsHash() => r'498a2fc2197a783182a276ed824fd5622278545f';

/// See also [UserFlashcards].
@ProviderFor(UserFlashcards)
final userFlashcardsProvider = AutoDisposeNotifierProvider<
  UserFlashcards,
  Map<String, List<Flashcard>>
>.internal(
  UserFlashcards.new,
  name: r'userFlashcardsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userFlashcardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserFlashcards = AutoDisposeNotifier<Map<String, List<Flashcard>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
