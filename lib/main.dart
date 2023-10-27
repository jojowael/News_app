import 'package:flutter/material.dart';
import 'package:flutter_app_news/home/home_screen.dart';
import 'package:flutter_app_news/news/news_details_screen.dart';
import 'package:flutter_app_news/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
        // CategoryDetails.routeName: (context) => CategoryDetails(category: ),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.LightTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
