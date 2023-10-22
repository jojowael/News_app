import 'dart:ui';

import 'package:flutter_app_news/my_theme.dart';

class Category {
  String id;
  String title;
  String imageUrl;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.color});

//list of category:
// business entertainment general health science sports technology

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imageUrl: 'assets/images/ball.png',
          color: MyTheme.redColor),
      Category(
          id: 'general',
          title: 'General',
          imageUrl: 'assets/images/Politics.png',
          color: MyTheme.darkBlueColor),
      Category(
          id: 'health',
          title: 'Health',
          imageUrl: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imageUrl: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imageUrl: 'assets/images/environment.png',
          color: MyTheme.blueColor),
      Category(
          id: 'science',
          title: 'Science',
          imageUrl: 'assets/images/science.png',
          color: MyTheme.yellowColor),
    ];
  }
}
