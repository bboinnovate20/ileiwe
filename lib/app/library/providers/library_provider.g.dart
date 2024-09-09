// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_provider.dart';

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
String _$firebaseStorageHash() => r'9ece783a064077980d64000c5d6f0b1846ff5c4c';

/// See also [firebaseStorage].
@ProviderFor(firebaseStorage)
final firebaseStorageProvider = AutoDisposeProvider<FirebaseStorage>.internal(
  firebaseStorage,
  name: r'firebaseStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseStorageRef = AutoDisposeProviderRef<FirebaseStorage>;
String _$libraryRepositoryHash() => r'772f3dba0b022fadb38835b4520b24ca1be93bad';

/// See also [libraryRepository].
@ProviderFor(libraryRepository)
final libraryRepositoryProvider =
    AutoDisposeProvider<LibraryRepository>.internal(
  libraryRepository,
  name: r'libraryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LibraryRepositoryRef = AutoDisposeProviderRef<LibraryRepository>;
String _$allBookAndCategoryHash() =>
    r'326bc072ea73e28373730758ee1d95f62fe0b673';

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

/// See also [allBookAndCategory].
@ProviderFor(allBookAndCategory)
const allBookAndCategoryProvider = AllBookAndCategoryFamily();

/// See also [allBookAndCategory].
class AllBookAndCategoryFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [allBookAndCategory].
  const AllBookAndCategoryFamily();

  /// See also [allBookAndCategory].
  AllBookAndCategoryProvider call({
    dynamic limit = true,
  }) {
    return AllBookAndCategoryProvider(
      limit: limit,
    );
  }

  @override
  AllBookAndCategoryProvider getProviderOverride(
    covariant AllBookAndCategoryProvider provider,
  ) {
    return call(
      limit: provider.limit,
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
  String? get name => r'allBookAndCategoryProvider';
}

/// See also [allBookAndCategory].
class AllBookAndCategoryProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [allBookAndCategory].
  AllBookAndCategoryProvider({
    dynamic limit = true,
  }) : this._internal(
          (ref) => allBookAndCategory(
            ref as AllBookAndCategoryRef,
            limit: limit,
          ),
          from: allBookAndCategoryProvider,
          name: r'allBookAndCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allBookAndCategoryHash,
          dependencies: AllBookAndCategoryFamily._dependencies,
          allTransitiveDependencies:
              AllBookAndCategoryFamily._allTransitiveDependencies,
          limit: limit,
        );

  AllBookAndCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final dynamic limit;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(AllBookAndCategoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllBookAndCategoryProvider._internal(
        (ref) => create(ref as AllBookAndCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _AllBookAndCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllBookAndCategoryProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllBookAndCategoryRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `limit` of this provider.
  dynamic get limit;
}

class _AllBookAndCategoryProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with AllBookAndCategoryRef {
  _AllBookAndCategoryProviderElement(super.provider);

  @override
  dynamic get limit => (origin as AllBookAndCategoryProvider).limit;
}

String _$eLibraryCategoryHash() => r'd85130251841e005ef959af8a65005dd0cb33bfe';

/// See also [eLibraryCategory].
@ProviderFor(eLibraryCategory)
const eLibraryCategoryProvider = ELibraryCategoryFamily();

/// See also [eLibraryCategory].
class ELibraryCategoryFamily
    extends Family<AsyncValue<List<ELibraryCategory>>> {
  /// See also [eLibraryCategory].
  const ELibraryCategoryFamily();

  /// See also [eLibraryCategory].
  ELibraryCategoryProvider call({
    dynamic limit = true,
  }) {
    return ELibraryCategoryProvider(
      limit: limit,
    );
  }

  @override
  ELibraryCategoryProvider getProviderOverride(
    covariant ELibraryCategoryProvider provider,
  ) {
    return call(
      limit: provider.limit,
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
  String? get name => r'eLibraryCategoryProvider';
}

/// See also [eLibraryCategory].
class ELibraryCategoryProvider
    extends AutoDisposeFutureProvider<List<ELibraryCategory>> {
  /// See also [eLibraryCategory].
  ELibraryCategoryProvider({
    dynamic limit = true,
  }) : this._internal(
          (ref) => eLibraryCategory(
            ref as ELibraryCategoryRef,
            limit: limit,
          ),
          from: eLibraryCategoryProvider,
          name: r'eLibraryCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eLibraryCategoryHash,
          dependencies: ELibraryCategoryFamily._dependencies,
          allTransitiveDependencies:
              ELibraryCategoryFamily._allTransitiveDependencies,
          limit: limit,
        );

  ELibraryCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final dynamic limit;

  @override
  Override overrideWith(
    FutureOr<List<ELibraryCategory>> Function(ELibraryCategoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ELibraryCategoryProvider._internal(
        (ref) => create(ref as ELibraryCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ELibraryCategory>> createElement() {
    return _ELibraryCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ELibraryCategoryProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ELibraryCategoryRef
    on AutoDisposeFutureProviderRef<List<ELibraryCategory>> {
  /// The parameter `limit` of this provider.
  dynamic get limit;
}

class _ELibraryCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<ELibraryCategory>>
    with ELibraryCategoryRef {
  _ELibraryCategoryProviderElement(super.provider);

  @override
  dynamic get limit => (origin as ELibraryCategoryProvider).limit;
}

String _$skitLibraryCategoryHash() =>
    r'27ec0992c567be50c245dff7e4428097f614c7bf';

/// See also [skitLibraryCategory].
@ProviderFor(skitLibraryCategory)
const skitLibraryCategoryProvider = SkitLibraryCategoryFamily();

/// See also [skitLibraryCategory].
class SkitLibraryCategoryFamily
    extends Family<AsyncValue<List<ESkitCategory>>> {
  /// See also [skitLibraryCategory].
  const SkitLibraryCategoryFamily();

  /// See also [skitLibraryCategory].
  SkitLibraryCategoryProvider call({
    dynamic limit = true,
  }) {
    return SkitLibraryCategoryProvider(
      limit: limit,
    );
  }

  @override
  SkitLibraryCategoryProvider getProviderOverride(
    covariant SkitLibraryCategoryProvider provider,
  ) {
    return call(
      limit: provider.limit,
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
  String? get name => r'skitLibraryCategoryProvider';
}

/// See also [skitLibraryCategory].
class SkitLibraryCategoryProvider
    extends AutoDisposeFutureProvider<List<ESkitCategory>> {
  /// See also [skitLibraryCategory].
  SkitLibraryCategoryProvider({
    dynamic limit = true,
  }) : this._internal(
          (ref) => skitLibraryCategory(
            ref as SkitLibraryCategoryRef,
            limit: limit,
          ),
          from: skitLibraryCategoryProvider,
          name: r'skitLibraryCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$skitLibraryCategoryHash,
          dependencies: SkitLibraryCategoryFamily._dependencies,
          allTransitiveDependencies:
              SkitLibraryCategoryFamily._allTransitiveDependencies,
          limit: limit,
        );

  SkitLibraryCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final dynamic limit;

  @override
  Override overrideWith(
    FutureOr<List<ESkitCategory>> Function(SkitLibraryCategoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SkitLibraryCategoryProvider._internal(
        (ref) => create(ref as SkitLibraryCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ESkitCategory>> createElement() {
    return _SkitLibraryCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SkitLibraryCategoryProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SkitLibraryCategoryRef
    on AutoDisposeFutureProviderRef<List<ESkitCategory>> {
  /// The parameter `limit` of this provider.
  dynamic get limit;
}

class _SkitLibraryCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<ESkitCategory>>
    with SkitLibraryCategoryRef {
  _SkitLibraryCategoryProviderElement(super.provider);

  @override
  dynamic get limit => (origin as SkitLibraryCategoryProvider).limit;
}

String _$booksHash() => r'58f62b5d5f876692f8db960f5119eee017b1a434';

/// See also [books].
@ProviderFor(books)
const booksProvider = BooksFamily();

/// See also [books].
class BooksFamily extends Family<AsyncValue<List<Book>>> {
  /// See also [books].
  const BooksFamily();

  /// See also [books].
  BooksProvider call({
    dynamic limit = true,
  }) {
    return BooksProvider(
      limit: limit,
    );
  }

  @override
  BooksProvider getProviderOverride(
    covariant BooksProvider provider,
  ) {
    return call(
      limit: provider.limit,
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
  String? get name => r'booksProvider';
}

/// See also [books].
class BooksProvider extends AutoDisposeFutureProvider<List<Book>> {
  /// See also [books].
  BooksProvider({
    dynamic limit = true,
  }) : this._internal(
          (ref) => books(
            ref as BooksRef,
            limit: limit,
          ),
          from: booksProvider,
          name: r'booksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$booksHash,
          dependencies: BooksFamily._dependencies,
          allTransitiveDependencies: BooksFamily._allTransitiveDependencies,
          limit: limit,
        );

  BooksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final dynamic limit;

  @override
  Override overrideWith(
    FutureOr<List<Book>> Function(BooksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BooksProvider._internal(
        (ref) => create(ref as BooksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Book>> createElement() {
    return _BooksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BooksProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BooksRef on AutoDisposeFutureProviderRef<List<Book>> {
  /// The parameter `limit` of this provider.
  dynamic get limit;
}

class _BooksProviderElement extends AutoDisposeFutureProviderElement<List<Book>>
    with BooksRef {
  _BooksProviderElement(super.provider);

  @override
  dynamic get limit => (origin as BooksProvider).limit;
}

String _$categoryBookHash() => r'860871f98892780752045a0f17c2fa7476d44489';

/// See also [categoryBook].
@ProviderFor(categoryBook)
const categoryBookProvider = CategoryBookFamily();

/// See also [categoryBook].
class CategoryBookFamily extends Family<AsyncValue<List<Book>>> {
  /// See also [categoryBook].
  const CategoryBookFamily();

  /// See also [categoryBook].
  CategoryBookProvider call({
    dynamic limit = true,
    required dynamic libraryId,
    required dynamic categoryId,
  }) {
    return CategoryBookProvider(
      limit: limit,
      libraryId: libraryId,
      categoryId: categoryId,
    );
  }

  @override
  CategoryBookProvider getProviderOverride(
    covariant CategoryBookProvider provider,
  ) {
    return call(
      limit: provider.limit,
      libraryId: provider.libraryId,
      categoryId: provider.categoryId,
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
  String? get name => r'categoryBookProvider';
}

/// See also [categoryBook].
class CategoryBookProvider extends AutoDisposeFutureProvider<List<Book>> {
  /// See also [categoryBook].
  CategoryBookProvider({
    dynamic limit = true,
    required dynamic libraryId,
    required dynamic categoryId,
  }) : this._internal(
          (ref) => categoryBook(
            ref as CategoryBookRef,
            limit: limit,
            libraryId: libraryId,
            categoryId: categoryId,
          ),
          from: categoryBookProvider,
          name: r'categoryBookProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryBookHash,
          dependencies: CategoryBookFamily._dependencies,
          allTransitiveDependencies:
              CategoryBookFamily._allTransitiveDependencies,
          limit: limit,
          libraryId: libraryId,
          categoryId: categoryId,
        );

  CategoryBookProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.libraryId,
    required this.categoryId,
  }) : super.internal();

  final dynamic limit;
  final dynamic libraryId;
  final dynamic categoryId;

  @override
  Override overrideWith(
    FutureOr<List<Book>> Function(CategoryBookRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryBookProvider._internal(
        (ref) => create(ref as CategoryBookRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        libraryId: libraryId,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Book>> createElement() {
    return _CategoryBookProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryBookProvider &&
        other.limit == limit &&
        other.libraryId == libraryId &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, libraryId.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryBookRef on AutoDisposeFutureProviderRef<List<Book>> {
  /// The parameter `limit` of this provider.
  dynamic get limit;

  /// The parameter `libraryId` of this provider.
  dynamic get libraryId;

  /// The parameter `categoryId` of this provider.
  dynamic get categoryId;
}

class _CategoryBookProviderElement
    extends AutoDisposeFutureProviderElement<List<Book>> with CategoryBookRef {
  _CategoryBookProviderElement(super.provider);

  @override
  dynamic get limit => (origin as CategoryBookProvider).limit;
  @override
  dynamic get libraryId => (origin as CategoryBookProvider).libraryId;
  @override
  dynamic get categoryId => (origin as CategoryBookProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
