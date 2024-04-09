import 'package:flutter/material.dart';
import 'package:food_ui/screens/homeScreen/homeScreen_view.dart';
import 'package:food_ui/screens/searchItem_screen/seachItem_screen_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app_RoutesSetup/app_routes.router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: "/",
    );
  }
}
