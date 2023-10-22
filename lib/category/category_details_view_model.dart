import 'package:flutter/material.dart';
import 'package:flutter_app_news/api/api_manager.dart';

import '../model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
//hold data,handle logic
  List<Source>? sourceList;
  String? errorMessage;

//logic
  void getSource(String categoryId) async {
    sourceList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response?.message;
      } else {
        sourceList = response?.sources;
      }
    } catch (e) {
      errorMessage = "Error Loading Sources List";
    }
    notifyListeners();
  }
}
