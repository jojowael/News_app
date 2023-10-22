import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;

  Function onDrawerItemClick;

  HomeDrawer({required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Text(
            AppLocalizations.of(context)!.news_app,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
