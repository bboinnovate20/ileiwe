// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_provider.dart';

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
String _$clubRepositoryHash() => r'7ebd35fd801268c0930fe5b4ba481d50d30d4591';

/// See also [clubRepository].
@ProviderFor(clubRepository)
final clubRepositoryProvider = AutoDisposeProvider<ClubRepository>.internal(
  clubRepository,
  name: r'clubRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clubRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClubRepositoryRef = AutoDisposeProviderRef<ClubRepository>;
String _$clubHash() => r'b58c3ed9b36a6d521d391d69a5332c94d4953f5e';

/// See also [club].
@ProviderFor(club)
final clubProvider = AutoDisposeFutureProvider<List<Club>>.internal(
  club,
  name: r'clubProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clubHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClubRef = AutoDisposeFutureProviderRef<List<Club>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
