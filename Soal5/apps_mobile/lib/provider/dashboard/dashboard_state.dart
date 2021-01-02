import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DashboardState extends ChangeNotifier {
  String date = "";
  int dayNow = 0;
  String hour;
  String formattedDate = "";
  String formattedYear = "";
  List<String> day = [
    "S",
    "S",
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
    "M"
  ];
  List<String> hours = [
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00"
  ];
  List<bool> isComplate = [
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true
  ];
  DashboardState() {
    dayNow = DateTime.now().day;
    DateTime now = DateTime.now();
    formattedDate = DateFormat('E,MMM').format(now);
    formattedYear = DateFormat('yyyy').format(now);
    print('$formattedDate $dayNow $formattedYear');
  }
  onClickedDate(int i) {
    dayNow = i;
    notifyListeners();
  }

  onComplated(int i) {
    isComplate[i] = !isComplate[i];
    notifyListeners();
  }
}
