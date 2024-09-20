// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_history_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinHistoryRepositoryHash() =>
    r'a5bf14ec0b5f81c29e6de16d1a99d675a0980d95';

/// See also [coinHistoryRepository].
@ProviderFor(coinHistoryRepository)
final coinHistoryRepositoryProvider =
    AutoDisposeProvider<CoinHistoryRepository>.internal(
  coinHistoryRepository,
  name: r'coinHistoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coinHistoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CoinHistoryRepositoryRef
    = AutoDisposeProviderRef<CoinHistoryRepository>;
String _$coinHistoriesHash() => r'ff8aa560e937dd6b315bc2df989aa05c54ed7258';

/// See also [CoinHistories].
@ProviderFor(CoinHistories)
final coinHistoriesProvider =
    AutoDisposeAsyncNotifierProvider<CoinHistories, List<CoinHistory>>.internal(
  CoinHistories.new,
  name: r'coinHistoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coinHistoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CoinHistories = AutoDisposeAsyncNotifier<List<CoinHistory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
