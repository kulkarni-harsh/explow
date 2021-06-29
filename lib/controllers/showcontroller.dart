import 'package:explow/model/Show.dart';
import 'package:explow/services/api/APIservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowController extends GetxController {
  var showList = List.empty(growable: true).obs;
  var isLoading = true.obs;
  @override
  void fetchShows(String showName) async {
    var shows = await ApiService.getapi(showName);
    if (shows != null) {
      var showList2 = List.empty(growable: true);
      for (var i = 0; i < shows.length; i++) {
        if (shows[i].image != null && shows[i].title != null) {
          showList2.add(shows[i]);
        }
      }
      showList.value = showList2;
    }

    print("controller ${shows!.length}");

    for (var i = 0; i < showList.length; i++) {
      print(' loop ${showList[i].title}');
    }
    isLoading(false);
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
