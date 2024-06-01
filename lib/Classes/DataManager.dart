import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';

class DataManager {
  DataManager._data();
  static final instance = DataManager._data();

  final _img = Appimg();
  Appimg get getimg => _img;

  final _icon = Appicon();
  Appicon get geticon => _icon;

  final _clr = Appcolor();
  Appcolor get getclr => _clr;

  final _font = AppTextTheme();
  AppTextTheme get getfont => _font;
}
