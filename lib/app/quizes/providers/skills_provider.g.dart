// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseFirestoreHash() => r'230b9276da2e44bb1aa6b300e1ddbb2f93c422da';

/// See also [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider =
    AutoDisposeProvider<FirebaseFirestore>.internal(
  firebaseFirestore,
  name: r'firebaseFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$quizRepositoryHash() => r'8336945bf1cd0f83a181cca76a18f993c617e9e6';

/// See also [quizRepository].
@ProviderFor(quizRepository)
final quizRepositoryProvider = AutoDisposeProvider<QuizRepository>.internal(
  quizRepository,
  name: r'quizRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quizRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef QuizRepositoryRef = AutoDisposeProviderRef<QuizRepository>;
String _$skillDataProviderHash() => r'c9fe9e13f73890f0ebcebcf480d807002c600eb7';

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

/// See also [skillDataProvider].
@ProviderFor(skillDataProvider)
const skillDataProviderProvider = SkillDataProviderFamily();

/// See also [skillDataProvider].
class SkillDataProviderFamily extends Family<AsyncValue<SkillsLearning>> {
  /// See also [skillDataProvider].
  const SkillDataProviderFamily();

  /// See also [skillDataProvider].
  SkillDataProviderProvider call(
    String skillId,
  ) {
    return SkillDataProviderProvider(
      skillId,
    );
  }

  @override
  SkillDataProviderProvider getProviderOverride(
    covariant SkillDataProviderProvider provider,
  ) {
    return call(
      provider.skillId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'skillDataProviderProvider';
}

/// See also [skillDataProvider].
class SkillDataProviderProvider
    extends AutoDisposeFutureProvider<SkillsLearning> {
  /// See also [skillDataProvider].
  SkillDataProviderProvider(
    String skillId,
  ) : this._internal(
          (ref) => skillDataProvider(
            ref as SkillDataProviderRef,
            skillId,
          ),
          from: skillDataProviderProvider,
          name: r'skillDataProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$skillDataProviderHash,
          dependencies: SkillDataProviderFamily._dependencies,
          allTransitiveDependencies:
              SkillDataProviderFamily._allTransitiveDependencies,
          skillId: skillId,
        );

  SkillDataProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.skillId,
  }) : super.internal();

  final String skillId;

  @override
  Override overrideWith(
    FutureOr<SkillsLearning> Function(SkillDataProviderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SkillDataProviderProvider._internal(
        (ref) => create(ref as SkillDataProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        skillId: skillId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SkillsLearning> createElement() {
    return _SkillDataProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SkillDataProviderProvider && other.skillId == skillId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, skillId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SkillDataProviderRef on AutoDisposeFutureProviderRef<SkillsLearning> {
  /// The parameter `skillId` of this provider.
  String get skillId;
}

class _SkillDataProviderProviderElement
    extends AutoDisposeFutureProviderElement<SkillsLearning>
    with SkillDataProviderRef {
  _SkillDataProviderProviderElement(super.provider);

  @override
  String get skillId => (origin as SkillDataProviderProvider).skillId;
}

String _$skillsLearningHash() => r'92072d82e3b64a49ff5ff979d0de3e4ac21216e7';

/// See also [skillsLearning].
@ProviderFor(skillsLearning)
final skillsLearningProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  skillsLearning,
  name: r'skillsLearningProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$skillsLearningHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SkillsLearningRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
