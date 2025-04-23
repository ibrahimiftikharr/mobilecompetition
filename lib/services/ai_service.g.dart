// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aiServiceHash() => r'd700a50cd10b2f04e9c7cf6a57dc24159de91015';

/// See also [aiService].
@ProviderFor(aiService)
final aiServiceProvider = AutoDisposeProvider<AIService>.internal(
  aiService as AIService Function(AutoDisposeProviderRef<AIService> ref),
  name: r'aiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AiServiceRef = AutoDisposeProviderRef<AIService>;
String _$generateSummaryHash() => r'5881804cb7d176e4af3215f9cb80abb2ddd33c13';

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

/// See also [generateSummary].
@ProviderFor(generateSummary)
const generateSummaryProvider = GenerateSummaryFamily();

/// See also [generateSummary].
class GenerateSummaryFamily extends Family<AsyncValue<String>> {
  /// See also [generateSummary].
  const GenerateSummaryFamily();

  /// See also [generateSummary].
  GenerateSummaryProvider call(String content) {
    return GenerateSummaryProvider(content);
  }

  @override
  GenerateSummaryProvider getProviderOverride(
    covariant GenerateSummaryProvider provider,
  ) {
    return call(provider.content);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'generateSummaryProvider';
}

/// See also [generateSummary].
class GenerateSummaryProvider extends AutoDisposeFutureProvider<String> {
  /// See also [generateSummary].
  GenerateSummaryProvider(String content)
    : this._internal(
        (ref) => generateSummary(ref as GenerateSummaryRef, content),
        from: generateSummaryProvider,
        name: r'generateSummaryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$generateSummaryHash,
        dependencies: GenerateSummaryFamily._dependencies,
        allTransitiveDependencies:
            GenerateSummaryFamily._allTransitiveDependencies,
        content: content,
      );

  GenerateSummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.content,
  }) : super.internal();

  final String content;

  @override
  Override overrideWith(
    FutureOr<String> Function(GenerateSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateSummaryProvider._internal(
        (ref) => create(ref as GenerateSummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        content: content,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GenerateSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateSummaryProvider && other.content == content;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, content.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenerateSummaryRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `content` of this provider.
  String get content;
}

class _GenerateSummaryProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with GenerateSummaryRef {
  _GenerateSummaryProviderElement(super.provider);

  @override
  String get content => (origin as GenerateSummaryProvider).content;
}

String _$generateFlashcardsHash() =>
    r'3ec2bc992ccd93822f42e9c86fee91b803a76d95';

/// See also [generateFlashcards].
@ProviderFor(generateFlashcards)
const generateFlashcardsProvider = GenerateFlashcardsFamily();

/// See also [generateFlashcards].
class GenerateFlashcardsFamily extends Family<AsyncValue<List<Flashcard>>> {
  /// See also [generateFlashcards].
  const GenerateFlashcardsFamily();

  /// See also [generateFlashcards].
  GenerateFlashcardsProvider call(String content) {
    return GenerateFlashcardsProvider(content);
  }

  @override
  GenerateFlashcardsProvider getProviderOverride(
    covariant GenerateFlashcardsProvider provider,
  ) {
    return call(provider.content);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'generateFlashcardsProvider';
}

/// See also [generateFlashcards].
class GenerateFlashcardsProvider
    extends AutoDisposeFutureProvider<List<Flashcard>> {
  /// See also [generateFlashcards].
  GenerateFlashcardsProvider(String content)
    : this._internal(
        (ref) => generateFlashcards(ref as GenerateFlashcardsRef, content),
        from: generateFlashcardsProvider,
        name: r'generateFlashcardsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$generateFlashcardsHash,
        dependencies: GenerateFlashcardsFamily._dependencies,
        allTransitiveDependencies:
            GenerateFlashcardsFamily._allTransitiveDependencies,
        content: content,
      );

  GenerateFlashcardsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.content,
  }) : super.internal();

  final String content;

  @override
  Override overrideWith(
    FutureOr<List<Flashcard>> Function(GenerateFlashcardsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateFlashcardsProvider._internal(
        (ref) => create(ref as GenerateFlashcardsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        content: content,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Flashcard>> createElement() {
    return _GenerateFlashcardsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateFlashcardsProvider && other.content == content;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, content.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenerateFlashcardsRef on AutoDisposeFutureProviderRef<List<Flashcard>> {
  /// The parameter `content` of this provider.
  String get content;
}

class _GenerateFlashcardsProviderElement
    extends AutoDisposeFutureProviderElement<List<Flashcard>>
    with GenerateFlashcardsRef {
  _GenerateFlashcardsProviderElement(super.provider);

  @override
  String get content => (origin as GenerateFlashcardsProvider).content;
}

String _$answerQuestionHash() => r'549dde5342e422f7e29857c41cb9a31ecb3640b1';

/// See also [answerQuestion].
@ProviderFor(answerQuestion)
const answerQuestionProvider = AnswerQuestionFamily();

/// See also [answerQuestion].
class AnswerQuestionFamily extends Family<AsyncValue<String>> {
  /// See also [answerQuestion].
  const AnswerQuestionFamily();

  /// See also [answerQuestion].
  AnswerQuestionProvider call(String question, String lessonContent) {
    return AnswerQuestionProvider(question, lessonContent);
  }

  @override
  AnswerQuestionProvider getProviderOverride(
    covariant AnswerQuestionProvider provider,
  ) {
    return call(provider.question, provider.lessonContent);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'answerQuestionProvider';
}

/// See also [answerQuestion].
class AnswerQuestionProvider extends AutoDisposeFutureProvider<String> {
  /// See also [answerQuestion].
  AnswerQuestionProvider(String question, String lessonContent)
    : this._internal(
        (ref) =>
            answerQuestion(ref as AnswerQuestionRef, question, lessonContent),
        from: answerQuestionProvider,
        name: r'answerQuestionProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$answerQuestionHash,
        dependencies: AnswerQuestionFamily._dependencies,
        allTransitiveDependencies:
            AnswerQuestionFamily._allTransitiveDependencies,
        question: question,
        lessonContent: lessonContent,
      );

  AnswerQuestionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.question,
    required this.lessonContent,
  }) : super.internal();

  final String question;
  final String lessonContent;

  @override
  Override overrideWith(
    FutureOr<String> Function(AnswerQuestionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnswerQuestionProvider._internal(
        (ref) => create(ref as AnswerQuestionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        question: question,
        lessonContent: lessonContent,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AnswerQuestionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnswerQuestionProvider &&
        other.question == question &&
        other.lessonContent == lessonContent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, question.hashCode);
    hash = _SystemHash.combine(hash, lessonContent.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnswerQuestionRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `question` of this provider.
  String get question;

  /// The parameter `lessonContent` of this provider.
  String get lessonContent;
}

class _AnswerQuestionProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with AnswerQuestionRef {
  _AnswerQuestionProviderElement(super.provider);

  @override
  String get question => (origin as AnswerQuestionProvider).question;
  @override
  String get lessonContent => (origin as AnswerQuestionProvider).lessonContent;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
