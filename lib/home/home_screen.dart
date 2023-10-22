import 'package:flutter/material.dart';
import 'package:flutter_app_news/category/category_details.dart';
import 'package:flutter_app_news/category/category_fragement.dart';
import 'package:flutter_app_news/model/category.dart';
import 'package:flutter_app_news/my_theme.dart';
import 'package:flutter_app_news/settings/settings.dart';
import 'package:flutter_app_news/tabs/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              selectedDrawerItem == HomeDrawer.settings
                  ? AppLocalizations.of(context)!.settings
                  : selectedCategory == null
                      ? AppLocalizations.of(context)!.news_app
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onDrawerItemClick: onDrawerItemClick,
            ),
          ),
          body: selectedDrawerItem == HomeDrawer.settings
              ? Settings()
              : selectedCategory == null
                  ? CategoryFragment(onCategoryClick: onCategoryClick)
                  : CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Sports',
    'General',
    'Health',
    'Business',
    'Entertainment',
    'Science'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(
        Icons.clear,
        color: MyTheme.blackColor,
      ),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null); //close SearchBar
        } else {
          query = '';
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
