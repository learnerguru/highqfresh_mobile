

import 'package:highqfresh/constant/DateFormatConstant.dart';
import 'package:intl/intl.dart';

class DateHelper{

  static DateTime formatDate(String inputDate,String inputFormat) {
    DateFormat dateFormat = DateFormat(inputFormat);
    return dateFormat.parse(inputDate);

  }

  static String formatDate2(String inputDate,String inputFormat) {

    return DateFormat.yMMMd().format(DateHelper.formatDate(
        inputDate,inputFormat));

  }

  static DateTime today(){
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime yesterday(){
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day - 1);
  }

  static DateTime tomorrow(){
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1);
  }

  static String startOfMonth(DateTime selectedDate){
    selectedDate = new DateTime(selectedDate.year,selectedDate.month,1);
    String date= DateFormat(DateFormatConstant.date_format).format(selectedDate);
    return date+" 12:00:00 AM";
  }

  static String endOfMonth(DateTime selectedDate){
    selectedDate = new DateTime(selectedDate.year,selectedDate.month+1,0);
    String date= DateFormat(DateFormatConstant.date_format).format(selectedDate);
    return date+" 11:59:59 PM";
  }

  static String startOfDay(DateTime selectedDate){
    String date= DateFormat(DateFormatConstant.date_format).format(selectedDate);
    return date+" 12:00:00 AM";
  }

  static String endOfDay(DateTime selectedDate){
    String date= DateFormat(DateFormatConstant.date_format).format(selectedDate);
    return date+" 11:59:59 PM";
  }


}