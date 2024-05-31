import 'package:dating_app/resources/constant/colorsheet.dart';

class DataManager {
  DataManager._data();
  static final data = DataManager;
  get getdata => data;
  get getAppclr => Appcolor();
}
