import 'package:flutter/cupertino.dart';
import 'package:sky_scrapper/screen/detail/view/showdetails_screen.dart';
import 'package:sky_scrapper/screen/home/view/home_screen.dart';
import 'package:sky_scrapper/screen/splesh/view/splesh_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
     '/' : (context) => const SpleshScreen(),
     'home' : (context) => const HomeScreen(),
     'details' : (context) => const ShowDetailsScreen(),
};