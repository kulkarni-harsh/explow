import 'package:explow/model/News.dart';
import 'package:explow/services/NewsAPI/NewsApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var news = List<Article>.empty(growable: true).obs;
  var isLoading = true.obs;
  var isHovered = 6900.obs;
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void fetchNews(String country) async {
    var newstemp = await NewsApi.getapi(country);
    if (newstemp != null) {
      news.value = newstemp;
      isLoading(false);
    }
  }

  void setHover(int i) {
    isHovered.value = i;
  }
}
