import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
