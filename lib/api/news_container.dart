import 'package:flutter/material.dart';
import 'package:flutter_app_news/api/api_manager.dart';
import 'package:flutter_app_news/model/NewsResponse.dart';

import '../model/SourceResponse.dart';

class NewsContainer extends StatelessWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsNySourceId(source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(newsList[index].title ?? '');
            },
            itemCount: newsList.length,
          );
        });
  }
}
