import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension TimeExtension  on String{
  String? convertToTime() {
    DateTime dateFormat = DateTime.parse(this);
    return DateFormat.jm().format(dateFormat);
  }

  String? convertToDate() {
    DateTime dateFormat = DateTime.parse(this);
    return DateFormat.MMMd().format(dateFormat);
  }

  String? convertToFullDate() {
    DateTime dateFormat = DateTime.parse(this);
    return DateFormat.yMMMd().format(dateFormat);
  }

  String? differenceDay() {
    DateTime dateFormat = DateTime.parse(this);
    final date = Jiffy(DateTime.now()).diff(dateFormat, Units.DAY).toString();
    if(date == "0") {
      return "Today";
    }
    if(date == "1"){
      return "Yesterday";
    }
    return "$date Days ago";
  }

  String? differenceHour() {
    DateTime dateFormat = DateTime.parse(this);
    final hours = Jiffy(DateTime.now()).diff(dateFormat, Units.HOUR).toString();
    return "$hours Hours ago";
  }
}