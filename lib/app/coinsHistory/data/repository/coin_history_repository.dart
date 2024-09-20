

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ileiwe/app/coinsHistory/data/models/coin_history.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:ileiwe/cores/utils/date_format.dart';

class CoinHistoryRepository {

  CoinHistoryRepository({required this.firestore});
  
    final FirebaseFirestore firestore;


  getHistory(String userId) async {
      try {
        
        final querySnapshot = await firestore.collection('coin_histories').doc(userId).collection('histories').get();
        
          List<Map<String, dynamic>> histories = [];

          for (var history in querySnapshot.docs) {
            final data = history.data() as Map;
            final date = data['timestamp'].split(" ")[0];
          
            histories.add({...data, "timestamp": date});
            
          }
          return ReturnedStatus(message: "", success: true, data: histories );                        
    
  } catch (e) {
    print("$e error");
    return ReturnedStatus(
      message: "Error fetching skills: $e",
      success: false,
    );
  }

  }



  addToHistory(String userId, CoinHistory coin) async {
      try {
        
        final historiesCollection = firestore.collection('coin_histories')
        .doc(userId).collection('histories');

       await historiesCollection.add(coin.toJson());


       final ReturnedStatus getNewData = await getHistory(userId);
      print('nnew date');
       print(getNewData.data);

       if(getNewData.success) {
          return ReturnedStatus(message: "", success: true, data: getNewData.data );                        

       }
  } catch (e) {
    print("error");
    print(e);
    return ReturnedStatus(
      message: "Error fetching skills: $e",
      success: false,
      data: []
    );
  }

  }


}