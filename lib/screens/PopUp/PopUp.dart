import 'package:explow/constants/constants.dart';
import 'package:explow/controllers/InfoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUp extends StatelessWidget {
  final InfoController _infoController = InfoController();
  var idtemp = Get.parameters['id'];
  var id = "tt4052886";
  @override
  Widget build(BuildContext context) {
    if (idtemp != null) id = idtemp!;
    _infoController.fetchInfo(id);
    print(_infoController.info.value.title);

    return Obx(
      () => Scaffold(
        backgroundColor: kPrimaryColor,
        body: _infoController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : isPhone(context)
                ? Container(
                    color: Colors.white70,
                    child: ListView(
                      children: [
                        Image.network(
                          "${_infoController.info.value.poster}",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        Divider(
                          height: 20,
                        ),
                      ]..addAll(detailsList),
                    ),
                  )
                : Stack(children: [
                    GestureDetector(
                      child: Container(
                        color: kPrimaryColor,
                      ),
                      onTap: () => Get.back(),
                    ),
                    AlertDialog(
                      backgroundColor: Colors.white,
                      content: Center(
                        child: Container(
                          width: 3 * MediaQuery.of(context).size.width / 5,
                          child: CardDetailsWidget(
                              infoController: _infoController,
                              detailsList: detailsList),
                        ),
                      ),
                    ),
                  ]),
      ),
    );
  }

  List<Widget> get detailsList {
    return [
      SelectableText(
          _infoController.info.value.genre != null
              ? "${_infoController.info.value.genre}"
              : "",
          style: kInfoTitle),
      SizedBox(
        height: 15,
      ),
      SelectableText("${_infoController.info.value.plot}",
          // overflow: TextOverflow.clip,
          style: kSubTitleStyle.copyWith(fontSize: 20, color: Colors.black87)),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "Language\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.language != null
                  ? ": ${_infoController.info.value.language}"
                  : ": No Info Found",
              style: kInfoDetail)
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "Country\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.language != null
                  ? ": ${_infoController.info.value.country}"
                  : ": No Info Found",
              style: kInfoDetail)
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "Director\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.director != null
                  ? ": ${_infoController.info.value.director}"
                  : ": No Info Found",
              style: kInfoDetail)
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "Writer\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.writer != null
                  ? ": ${_infoController.info.value.writer}"
                  : ": No Info Found",
              style: kInfoDetail)
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "Production\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.production != null
                  ? ": ${_infoController.info.value.production}"
                  : ": No Info Found",
              style: kInfoDetail)
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "Awards\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.awards != null
                  ? ": ${_infoController.info.value.awards}"
                  : ": No Info Found",
              style: kInfoDetail),
        ]),
      ),
      SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: "IMDb Ratings\t\t\t", style: kInfoTitle),
          TextSpan(
              text: _infoController.info.value.imdbRating != null
                  ? ": ${_infoController.info.value.imdbRating}"
                  : ": No Info Found",
              style: kInfoDetail)
        ]),
      ),
    ];
  }
}

class CardDetailsWidget extends StatelessWidget {
  const CardDetailsWidget({
    Key? key,
    required InfoController infoController,
    required this.detailsList,
  })  : _infoController = infoController,
        super(key: key);

  final InfoController _infoController;
  final List<Widget> detailsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectableText(
          _infoController.info.value.title != null
              ? "${_infoController.info.value.title}"
              : "title",
          style: kTitleStyle.copyWith(fontSize: 40),
        ),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                _infoController.info.value.actors != null
                    ? "${_infoController.info.value.actors}"
                    : "",
                textAlign: TextAlign.left,
                style: kSubTitleStyle.copyWith(
                    fontSize: 20, color: Colors.black45),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Rated \t\t\t", style: kInfoTitle),
                  TextSpan(
                      text: _infoController.info.value.rated != null
                          ? "${_infoController.info.value.rated}"
                          : "",
                      style: kInfoDetail)
                ]),
              ),
            ],
          ),
          Spacer(),
          SelectableText(
            _infoController.info.value.runtime != null
                ? "${_infoController.info.value.runtime}"
                : "",
            textAlign: TextAlign.left,
            style: kSubTitleStyle.copyWith(fontSize: 20, color: Colors.black87),
          ),
        ]),
        SizedBox(
          height: 40,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "${_infoController.info.value.poster}",
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: MediaQuery.of(context).size.height <
                      MediaQuery.of(context).size.width
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: detailsList,
                    )
                  : Text(""),
            )
          ],
        ),
        Expanded(
          child: MediaQuery.of(context).size.height >
                  MediaQuery.of(context).size.width
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: detailsList,
                )
              : Text(""),
        )
      ],
    );
  }
}
