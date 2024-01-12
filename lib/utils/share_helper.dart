
import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper
{
  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }
  //
  // Future<void> setData()
  // async {
  //   SharedPreferences shr = await SharedPreferences.getInstance();
  //   shr.setStringList("city", cityName);
  // }
  // Future<List?> getData()
  // async {
  //   SharedPreferences shr = await SharedPreferences.getInstance();
  //   List? cityName = shr.getStringList(city);
  //   return cityName;
  // }
}