

import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/coinsHistory/data/models/coin_history.dart';
import 'package:ileiwe/app/coinsHistory/data/repository/coin_history_repository.dart';
import 'package:ileiwe/app/quizes/providers/skills_provider.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_history_notifier.g.dart';

@riverpod
CoinHistoryRepository coinHistoryRepository(CoinHistoryRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);

  return CoinHistoryRepository(firestore: firestore); 
}


@riverpod
class CoinHistories extends _$CoinHistories {
  @override
  Future<List<CoinHistory>> build() async {
      final coinRepo = ref.watch(coinHistoryRepositoryProvider);
      final userId = ref.watch(userStateNotifierProvider).userId;

      final ReturnedStatus response = await coinRepo.getHistory(userId);

      if(response.success) {
          final newHistory = (response.data as List).cast<Map<String, Object?>>()
                            .map(CoinHistory.fromJson).toList();
          
          return newHistory;
      }
      
      return [];
  }

  addCoin(CoinHistory history) async {
    final userId = ref.read(userStateNotifierProvider).userId;
    final ReturnedStatus response = await ref.read(coinHistoryRepositoryProvider).addToHistory(userId, history);

    if(response.success) {
      final newHistory = (response.data as List).cast<Map<String, Object?>>()
                            .map(CoinHistory.fromJson).toList();

      state = AsyncData(newHistory);
    }

  }

  // Future<void> addTodo(Todo todo) async {
  //   await http.post(
  //     Uri.https('your_api.com', '/todos'),
  //     // We serialize our Todo object and POST it to the server.
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(todo.toJson()),
  //   );
  // }
}