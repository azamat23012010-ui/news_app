import 'package:flutter/material.dart';
import 'package:news_app/src/features/main/main.dart';
import 'package:news_app/src/features/auth/forgot_passwrod_screen.dart';
import 'package:news_app/src/features/auth/login_screen.dart';
import 'package:news_app/src/features/connection/screens/no_found_screen.dart';
import 'package:news_app/src/features/connection/screens/no_internet_screen.dart';
import 'package:news_app/src/features/home/model/news_model.dart';
import 'package:news_app/src/features/home/screens/detail_screen.dart';
import 'package:news_app/src/features/home/screens/home_screen.dart';
import 'package:news_app/src/features/settings/about_screen.dart';
import 'package:news_app/src/features/settings/account_screen.dart';
import 'package:news_app/src/features/settings/change_password_screen.dart';
import 'package:news_app/src/features/settings/settings_screen.dart';
import 'package:news_app/src/features/settings/terms_screen.dart';

class AppRouter {
  static Route? onGenarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return onPageChange(HomeScreen());
      case '/no_internet':
        return onPageChange(NoInternetScreen());
      case '/detail':
        final model = settings.arguments as Article;
        return onPageChange(DetailScreen(model: model));
      case '/main':
        return onPageChange(BottomBar());

      //\\ auth and profile details
      case '/terms':
        return onPageChange(TermsConditionsScreen());
      case '/settings':
        return onPageChange(SettingsScreen());
      case '/change_password':
        return onPageChange(ChangePasswordScreen());
      case '/forgot_password':
        return onPageChange(ForgotPassword());
      case '/about':
        return onPageChange(AboutScreen());
      case '/account':
        return onPageChange(AccountScreen());
      case '/login':
        return onPageChange(LoginScreen());
      default:
        return onPageChange(NoFoundScreen());
    }
  }

  static MaterialPageRoute onPageChange(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
