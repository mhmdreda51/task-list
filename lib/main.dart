import 'package:flutter/material.dart';
import 'package:task_list/core/router/router.dart';
import 'package:task_list/view/home/homeScreen.dart';

import 'core/cacheHelper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  await CacheHelper.init();
  //===============================================================

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: const HomeScreen(),
    );
  }
}
