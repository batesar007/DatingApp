import 'package:dating_app/resources/Api/ApiData.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';

class DataManager {
  DataManager._data();

  //insliger
  static final instance = DataManager._data();

// img
  final _img = Appimg();
  Appimg get getimg => _img;

// appicon
  final _icon = Appicon();
  Appicon get geticon => _icon;

//appcolr
  final _clr = Appcolor();
  Appcolor get getclr => _clr;

//apptexttheme
  final _font = AppTextTheme();
  AppTextTheme get getfont => _font;

//api
  final _Api = ApiData();
  ApiData get getapis => _Api;
}
