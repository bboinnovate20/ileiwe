


import 'package:firebase_auth/firebase_auth.dart';
import 'package:ileiwe/app/auth/model/data_sources/auth_data_source.dart';
import 'package:ileiwe/app/auth/model/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
FirebaseAuthRepository firebaseAuthRepository(FirebaseAuthRepositoryRef ref) {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final authRemoteDataSource = FirebaseAuthDataSource(instance: firebaseAuthInstance);

  return FirebaseAuthRepository(dataSource: authRemoteDataSource);
}
