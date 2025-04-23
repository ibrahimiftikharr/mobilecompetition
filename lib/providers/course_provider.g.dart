// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coursesByDepartmentHash() =>
    r'00fa91628db837034774b5a43f08697e89584731';

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

/// See also [coursesByDepartment].
@ProviderFor(coursesByDepartment)
const coursesByDepartmentProvider = CoursesByDepartmentFamily();

/// See also [coursesByDepartment].
class CoursesByDepartmentFamily extends Family<List<Course>> {
  /// See also [coursesByDepartment].
  const CoursesByDepartmentFamily();

  /// See also [coursesByDepartment].
  CoursesByDepartmentProvider call(String departmentId) {
    return CoursesByDepartmentProvider(departmentId);
  }

  @override
  CoursesByDepartmentProvider getProviderOverride(
    covariant CoursesByDepartmentProvider provider,
  ) {
    return call(provider.departmentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'coursesByDepartmentProvider';
}

/// See also [coursesByDepartment].
class CoursesByDepartmentProvider extends AutoDisposeProvider<List<Course>> {
  /// See also [coursesByDepartment].
  CoursesByDepartmentProvider(String departmentId)
    : this._internal(
        (ref) =>
            coursesByDepartment(ref as CoursesByDepartmentRef, departmentId),
        from: coursesByDepartmentProvider,
        name: r'coursesByDepartmentProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coursesByDepartmentHash,
        dependencies: CoursesByDepartmentFamily._dependencies,
        allTransitiveDependencies:
            CoursesByDepartmentFamily._allTransitiveDependencies,
        departmentId: departmentId,
      );

  CoursesByDepartmentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.departmentId,
  }) : super.internal();

  final String departmentId;

  @override
  Override overrideWith(
    List<Course> Function(CoursesByDepartmentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CoursesByDepartmentProvider._internal(
        (ref) => create(ref as CoursesByDepartmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Course>> createElement() {
    return _CoursesByDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoursesByDepartmentProvider &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoursesByDepartmentRef on AutoDisposeProviderRef<List<Course>> {
  /// The parameter `departmentId` of this provider.
  String get departmentId;
}

class _CoursesByDepartmentProviderElement
    extends AutoDisposeProviderElement<List<Course>>
    with CoursesByDepartmentRef {
  _CoursesByDepartmentProviderElement(super.provider);

  @override
  String get departmentId =>
      (origin as CoursesByDepartmentProvider).departmentId;
}

String _$tutorCoursesHash() => r'a7fab92bf0e7835e8a63274f32973c6943d289a8';

/// See also [tutorCourses].
@ProviderFor(tutorCourses)
final tutorCoursesProvider = AutoDisposeProvider<List<Course>>.internal(
  tutorCourses,
  name: r'tutorCoursesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tutorCoursesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TutorCoursesRef = AutoDisposeProviderRef<List<Course>>;
String _$selectedCourseHash() => r'bc55c0ad691eea5b82bb71c3dc7a383c5984b4c4';

/// See also [SelectedCourse].
@ProviderFor(SelectedCourse)
final selectedCourseProvider =
    AutoDisposeNotifierProvider<SelectedCourse, Course?>.internal(
      SelectedCourse.new,
      name: r'selectedCourseProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedCourseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedCourse = AutoDisposeNotifier<Course?>;
String _$enrolledCoursesHash() => r'0cb67647b543b01a3d710b169a7a7744e36d216d';

/// See also [EnrolledCourses].
@ProviderFor(EnrolledCourses)
final enrolledCoursesProvider =
    AutoDisposeNotifierProvider<EnrolledCourses, List<Course>>.internal(
      EnrolledCourses.new,
      name: r'enrolledCoursesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$enrolledCoursesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$EnrolledCourses = AutoDisposeNotifier<List<Course>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
