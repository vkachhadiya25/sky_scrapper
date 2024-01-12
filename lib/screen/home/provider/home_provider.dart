import 'package:flutter/material.dart';
import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/utils/api_helper.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? homeModel;
  bool islight = false;
  String selectedCity = "surat";
  bool isOnline = false;


  Future<void> getWeatherAPI() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? h1 = await apiHelper.weatherAPICall(selectedCity);
    homeModel = h1;
    notifyListeners();
  }



  void city(String cityName) {
    selectedCity = cityName;
    notifyListeners();
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    islight = isTheme ?? true;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

}
