import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_theme.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news-details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(news.title ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 10,
            ),
            Text(news.content ?? ""),
            SizedBox(
              height: 10,
            ),
            Text(
              news.publishedAt ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => launchNewsUrl(news.url ?? ""),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View full article',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> launchNewsUrl(String url) async {
    var uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
