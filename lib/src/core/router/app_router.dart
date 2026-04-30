import 'package:flutter/material.dart';
import 'package:news_app/src/features/connection/screens/no_found_screen.dart';
import 'package:news_app/src/features/connection/screens/no_internet_screen.dart';
import 'package:news_app/src/features/home/model/news_model.dart';
import 'package:news_app/src/features/home/screens/detail_screen.dart';
import 'package:news_app/src/features/home/screens/home_screen.dart';

class AppRouter {
  static Route? onGenarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return onPageChange(HomeScreen());
      case '/no_internet':
        return onPageChange(NoInternetScreen());
      case '/detail':
      final model = settings.arguments as Article;
        return onPageChange(DetailScreen(model: model ));
      default:
        return onPageChange(NoFoundScreen());
    }
  }

  static MaterialPageRoute onPageChange(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
