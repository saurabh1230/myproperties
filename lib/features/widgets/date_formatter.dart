
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class DateFormatter {
  static String convertDateToDate(String date) {
    return DateFormat('dd MMM yyyy').format(DateFormat('yyyy-MM-dd').parse(date));
  }



}
