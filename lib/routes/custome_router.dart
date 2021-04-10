import 'package:flutter/Material.dart';
import 'package:localization_flutter/pages/about_page.dart';
import 'package:localization_flutter/pages/home_page.dart';
import 'package:localization_flutter/pages/notfound_page.dart';
import 'package:localization_flutter/pages/settings_page.dart';
import 'package:localization_flutter/routes/route_name.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (context) => AboutPage());
      case settingRoute:
        return MaterialPageRoute(builder: (context) => SettingPage());

        break;
      default:
        return MaterialPageRoute(builder: (context) => NotFoundPage());
    }
  }
}
