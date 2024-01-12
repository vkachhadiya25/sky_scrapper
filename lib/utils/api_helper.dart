import 'dart:convert';

import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/utils/constant.dart';
import 'package:http/http.dart' as http;

class APIHelper
{
  Future<HomeModel?> weatherAPICall(String city)
  async {
    var response = await http.get(Uri.parse("$base_url?appid=$key&q=$city"));

    if(response.statusCode == STATUS_CODE)
      {
       var weatherData =  jsonDecode(response.body);
       HomeModel weather = HomeModel.mapToModel(weatherData);
       return weather;

      }
    return null;
  }
}