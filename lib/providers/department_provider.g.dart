// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentsHash() => r'd7cb7de7fe274510da5271cdfcbea5479d561f07';

/// See also [departments].
@ProviderFor(departments)
final departmentsProvider = AutoDisposeProvider<List<Department>>.internal(
  departments,
  name: r'departmentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$departmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DepartmentsRef = AutoDisposeProviderRef<List<Department>>;
String _$selectedDepartmentHash() =>
    r'd4854c9455bf225c373346be425167327e6a1f13';

/// See also [SelectedDepartment].
@ProviderFor(SelectedDepartment)
final selectedDepartmentProvider =
    AutoDisposeNotifierProvider<SelectedDepartment, Department?>.internal(
      SelectedDepartment.new,
      name: r'selectedDepartmentProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedDepartmentHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedDepartment = AutoDisposeNotifier<Department?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
