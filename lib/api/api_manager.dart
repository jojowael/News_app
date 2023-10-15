import 'dart:convert';

import 'package:flutter_app_news/api/api_constants.dart';
import 'package:flutter_app_news/model/NewsResponse.dart';
import 'package:flutter_app_news/model/SourceResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    /*https://newsapi.org/v2/top-headlines/sources?apiKey=df7c64d9cf464595ae43386336446e95
     */
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sourceApi,
        {'apiKey': 'df7c64d9cf464595ae43386336446e95'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsNySourceId(String sourceId) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=df7c64d9cf464595ae43386336446e95
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsApi,
        {'apiKey': 'df7c64d9cf464595ae43386336446e95', 'sources': sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
