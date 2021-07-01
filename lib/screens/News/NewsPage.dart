import 'dart:html';
import 'dart:math';

import 'package:explow/constants/constants.dart';
import 'package:explow/controllers/NewsController.dart';
import 'package:explow/screens/Drawer/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:toggle_switch/toggle_switch.dart';

class NewsPage extends StatelessWidget {
  NewsController newsController = Get.put(NewsController());
  var outlineColor = Colors.white;
  var width = 1.0;
  @override
  Widget build(BuildContext context) {
    newsController.fetchNews("us");

    return Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: kPrimaryColor,
        key: newsController.scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColorDark,
          toolbarHeight: 200,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 45,
                    ),
                    onPressed: newsController.openDrawer,
                  ),
                  Spacer(),
                  Text(
                    "EXPLOW",
                    style: kTitleStyle,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      size: 45,
                    ),
                    onPressed: () {
                      int i = Random().nextInt(10);
                      if (i.isEven)
                        _launchURL("https://github.com/kulkarni-harsh/explow");
                      else
                        _launchURL("https://youtu.be/dQw4w9WgXcQ");
                    },
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Your Favorite Media Explorer",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: kSubTitleStyle,
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ToggleSwitch(
                  customTextStyles: [kSubTitleStyle, kSubTitleStyle],
                  minWidth: 90.0,
                  minHeight: 70.0,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ["US", "India"],
                  iconSize: 30.0,
                  activeBgColors: [
                    [Colors.blueAccent, Colors.redAccent],
                    [Colors.green, Colors.orange]
                  ],
                  animate: true,
                  curve: Curves.bounceInOut,
                  onToggle: (index) {
                    newsController.fetchNews(index == 0 ? "us" : "in");
                    print('switched to: $index');
                  },
                ),
              ])
            ],
          ),
        ),
        body: Obx(
          () => Column(children: [
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(20),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                crossAxisCount: isPhone(context) ? 4 : 8,
                itemCount: newsController.news.length,
                staggeredTileBuilder: (index) => StaggeredTile.count(
                    2, index.isEven && index % 5 != 0 ? 1.5 : 2),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _launchURL("${newsController.news[index].url}");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: outlineColor,
                          width: width,
                        ),
                      ),
                      child: Stack(children: [
                        Image.network(
                          newsController.news[index].urlToImage == null
                              ? 'https://cors.bridged.cc/' +
                                  "https://via.placeholder.com/728x90.png?text=News"
                              : 'https://cors.bridged.cc/' +
                                  "${newsController.news[index].urlToImage}",
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              newsController.news[index].urlToImage == null
                                  ? Center(child: Text("Some Error Occured"))
                                  : Image.network(
                                      "${newsController.news[index].urlToImage}",
                                      fit: BoxFit.fill,
                                      height: double.infinity,
                                      width: double.infinity,
                                      errorBuilder: (a, b, c) => Image.network(
                                        "https://via.placeholder.com/728x90.png?text=News",
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                    ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                              padding: EdgeInsets.all(8),
                              width: isPhone(context)
                                  ? MediaQuery.of(context).size.width / 2 - 3
                                  : MediaQuery.of(context).size.width / 4 - 3,
                              child: Text(
                                "${newsController.news[index].title}",
                                textWidthBasis: TextWidthBasis.parent,
                                style: isPhone(context)
                                    ? kSubTitleStyleMini
                                    : kSubTitleStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              decoration: BoxDecoration(
                                  color: kPrimaryColorDark.withOpacity(0.9))),
                        )
                      ]),
                    ),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
