import 'package:explow/screens/News/NewsPage.dart';
import 'package:explow/screens/PopUp/PopUp.dart';
import 'package:explow/screens/SearchPage/SearchPage.dart';
import 'package:explow/screens/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xFF44406F),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/searchpage/:title",
          page: () => SearchPage(),
        ),
        GetPage(
          name: "/news/",
          page: () => NewsPage(),
        ),
        GetPage(
          name: "/info/:id",
          page: () => PopUp(),
        ),
      ],
    );
  }
}
