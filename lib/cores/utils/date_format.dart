import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String formatFirebaseTimestamp(Timestamp timestamp) {
  final DateTime date = timestamp.toDate();
  final String day = _addOrdinalSuffix(date.day);
  final String month = DateFormat('MMMM').format(date);
  final String year = date.year.toString();

  return '$day $month $year';
}

String _addOrdinalSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '${day}th';
  }
  switch (day % 10) {
    case 1:
      return '${day}st';
    case 2:
      return '${day}nd';
    case 3:
      return '${day}rd';
    default:
      return '${day}th';
  }
}
