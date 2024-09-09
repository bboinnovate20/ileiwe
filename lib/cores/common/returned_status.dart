
class ReturnedStatus {
   ReturnedStatus({required this.message, required this.success, this.otherData = const {}, this.data});

   String message;
   bool success;

  Map<String, dynamic> otherData;
  var data;


  // factory ReturnedStatus.fromJson(Map<String, String> json){
  //   return ReturnedStatus(json['message'] as String, json['success'] as bool);
  // }
  
  // factory ReturnedStatus.returnedStatus({required String message, required bool success, Map<String, dynamic>? otherData}) {
  //     return ReturnedStatus(message, success,  otherData: otherData ?? {});
  // }

  // factory ReturnedStatus.returnedStatusOther({required String message, required bool success, required Map<String, dynamic> otherData}) {
  //     return ReturnedStatus(message, success, otherData: otherData);
  // }

  
}
