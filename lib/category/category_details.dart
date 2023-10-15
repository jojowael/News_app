import 'package:flutter/material.dart';
import 'package:flutter_app_news/api/api_manager.dart';
import 'package:flutter_app_news/category/tab_container.dart';
import 'package:flutter_app_news/model/SourceResponse.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'category-details';

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
      body: FutureBuilder<SourceResponse?>(
          future: ApiManager.getSources(),
          builder: (context, snapchot) {
            if (snapchot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapchot.hasError) {
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('Try again'))
                ],
              );
            }
            //server rad(success,error)
            if (snapchot.data?.status != 'ok') {
              //error,message,code
              return Column(
                children: [
                  Text(snapchot.data?.message ?? ''),
                  ElevatedButton(onPressed: () {}, child: Text('Try again'))
                ],
              );
            }
            var sourcesList = snapchot.data?.sources ?? [];
            return TabContainer(sourcesList: sourcesList);
          }),
    );
  }
}
