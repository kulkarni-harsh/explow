import 'package:explow/components/Header.dart';
import 'package:explow/components/SearchField.dart';
import 'package:explow/components/ShowType.dart';
import 'package:explow/constants/constants.dart';
import 'package:explow/controllers/showcontroller.dart';
import 'package:explow/screens/Drawer/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final ShowController showController = Get.put(ShowController());
  TextEditingController mycontroller = TextEditingController();
  var titlex = Get.parameters['title'];
  var title = "abc";
  @override
  Widget build(BuildContext context) {
    if (titlex != null) {
      title = titlex!;
    }
    showController.fetchShows(title);
    return WillPopScope(
      onWillPop: () async => true,
      child: Obx(() => Scaffold(
          drawer: NavigationDrawer(),
          key: showController.scaffoldKey,
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColorDark,
              toolbarHeight: 200,
              title: Column(
                children: [
                  Header(showController: showController),
                  SearchField(mycontroller: mycontroller)
                ],
              )),
          body: showController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(10),
                          mainAxisSpacing: 40,
                          crossAxisSpacing: 40,
                          crossAxisCount: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? 12
                              : 4,
                          itemCount: showController.showList.length,
                          itemBuilder: (context, index) => Container(
                              height: MediaQuery.of(context).size.height / 2.2,
                              width: MediaQuery.of(context).size.width / 8,
                              decoration: kShowCard,
                              child: GestureDetector(
                                onTap: () {
                                  print(showController.showList[index].id
                                      .substring(
                                          7,
                                          showController
                                                  .showList[index].id.length -
                                              1));
                                  Get.toNamed(
                                      '/info/${showController.showList[index].id.substring(7, showController.showList[index].id.length - 1)}');
                                },
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(flex: 3, child: getImage(index)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                        child: showShortDetails(context, index))
                                  ],
                                ),
                              )),
                          staggeredTileBuilder: (index) =>
                              StaggeredTile.fit(2)),
                    ),
                  ],
                ))),
    );
  }

  Widget showShortDetails(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              showController.showList[index].title != null
                  ? showController.showList[index].title
                  : "",
              textAlign: TextAlign.left,
              style: isPhone(context)
                  ? kSubTitleStyleMini.copyWith(color: Colors.white)
                  : kSubTitleStyle.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          showController.showList[index].titleType != null
              ? getType("${showController.showList[index].titleType}")
              : Text(""),
          Text(
              showController.showList[index].year != null
                  ? "${showController.showList[index].year}."
                  : "",
              textAlign: TextAlign.left,
              style: isPhone(context)
                  ? kShowCardDetailsTextMini
                  : kShowCardDetailsText),
          Expanded(
            child: Text(
                showController.showList[index].runningTimeInMinutes != null
                    ? "${showController.showList[index].runningTimeInMinutes} Mins."
                    : "",
                style: isPhone(context)
                    ? kShowCardDetailsTextMini
                    : kShowCardDetailsText),
          ),
        ],
      ),
    );
  }

  Widget getImage(int index) {
    try {
      print("$index,${showController.showList[index].image}");
      var j = Image.network(
        showController.showList[index].image.url,
        fit: BoxFit.fill,
      );
      return j;
    } catch (e) {
      return Icon(Icons.movie, size: 50);
    }
  }
}
