import 'package:flutter/material.dart';
import 'package:flutter_app_news/category/category_details.dart';
import 'package:flutter_app_news/home/home_screen.dart';

import 'my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) => CategoryDetails(),
      },
      initialRoute: CategoryDetails.routeName,
      theme: MyTheme.LightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
