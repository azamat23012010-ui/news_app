import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/src/core/colors/app_colors.dart';
import 'package:news_app/src/core/router/app_router.dart';
import 'package:news_app/src/features/home/cubit/home_cubit.dart';

final GlobalKey<NavigatorState> _key = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  bool isConnected = true;

  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        Navigator.pushNamed(_key.currentContext!, '/no_internet');
      } else {
        Navigator.pushNamedAndRemoveUntil(_key.currentContext!,'/main',(_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _key,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      onGenerateRoute: AppRouter.onGenarateRoute,
      initialRoute: GetStorage().read('email') != null ? '/main' : '/login',
    );
  }
}
