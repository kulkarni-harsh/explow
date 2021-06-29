// To parse this JSON data, do
//
//     final show = showFromJson(jsonString);

import 'dart:convert';

Show showFromJson(String str) => Show.fromJson(json.decode(str));

String showToJson(Show data) => json.encode(data.toJson());

class Show {
  Show({
    this.meta,
    this.type,
    this.query,
    this.results,
    this.types,
  });

  Meta? meta;
  String? type;
  String? query;
  List<Result>? results;
  List<String>? types;

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        meta: json["@meta"] == null ? null : Meta.fromJson(json["@meta"]),
        type: json["@type"] == null ? null : json["@type"],
        query: json["query"] == null ? null : json["query"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        types: json["types"] == null
            ? null
            : List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@meta": meta == null ? null : meta!.toJson(),
        "@type": type == null ? null : type,
        "query": query == null ? null : query,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "types":
            types == null ? null : List<dynamic>.from(types!.map((x) => x)),
      };
}

class Meta {
  Meta({
    this.operation,
    this.requestId,
    this.serviceTimeMs,
  });

  String? operation;
  String? requestId;
  double? serviceTimeMs;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        operation: json["operation"] == null ? null : json["operation"],
        requestId: json["requestId"] == null ? null : json["requestId"],
        serviceTimeMs: json["serviceTimeMs"] == null
            ? null
            : json["serviceTimeMs"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "operation": operation == null ? null : operation,
        "requestId": requestId == null ? null : requestId,
        "serviceTimeMs": serviceTimeMs == null ? null : serviceTimeMs,
      };
}

class Result {
  Result({
    this.id,
    this.image,
    this.runningTimeInMinutes,
    this.nextEpisode,
    this.numberOfEpisodes,
    this.seriesEndYear,
    this.seriesStartYear,
    this.title,
    this.titleType,
    this.year,
    this.principals,
    this.episode,
    this.season,
    this.parentTitle,
    this.previousEpisode,
  });

  String? id;
  Image? image;
  int? runningTimeInMinutes;
  String? nextEpisode;
  int? numberOfEpisodes;
  int? seriesEndYear;
  int? seriesStartYear;
  String? title;
  String? titleType;
  int? year;
  List<Principal>? principals;
  int? episode;
  int? season;
  ParentTitle? parentTitle;
  String? previousEpisode;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        runningTimeInMinutes: json["runningTimeInMinutes"] == null
            ? null
            : json["runningTimeInMinutes"],
        nextEpisode: json["nextEpisode"] == null ? null : json["nextEpisode"],
        numberOfEpisodes:
            json["numberOfEpisodes"] == null ? null : json["numberOfEpisodes"],
        seriesEndYear:
            json["seriesEndYear"] == null ? null : json["seriesEndYear"],
        seriesStartYear:
            json["seriesStartYear"] == null ? null : json["seriesStartYear"],
        title: json["title"] == null ? null : json["title"],
        titleType: json["titleType"] == null ? null : json["titleType"],
        year: json["year"] == null ? null : json["year"],
        principals: json["principals"] == null
            ? null
            : List<Principal>.from(
                json["principals"].map((x) => Principal.fromJson(x))),
        episode: json["episode"] == null ? null : json["episode"],
        season: json["season"] == null ? null : json["season"],
        parentTitle: json["parentTitle"] == null
            ? null
            : ParentTitle.fromJson(json["parentTitle"]),
        previousEpisode:
            json["previousEpisode"] == null ? null : json["previousEpisode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image!.toJson(),
        "runningTimeInMinutes":
            runningTimeInMinutes == null ? null : runningTimeInMinutes,
        "nextEpisode": nextEpisode == null ? null : nextEpisode,
        "numberOfEpisodes": numberOfEpisodes == null ? null : numberOfEpisodes,
        "seriesEndYear": seriesEndYear == null ? null : seriesEndYear,
        "seriesStartYear": seriesStartYear == null ? null : seriesStartYear,
        "title": title == null ? null : title,
        "titleType": titleType == null ? null : titleType,
        "year": year == null ? null : year,
        "principals": principals == null
            ? null
            : List<dynamic>.from(principals!.map((x) => x.toJson())),
        "episode": episode == null ? null : episode,
        "season": season == null ? null : season,
        "parentTitle": parentTitle == null ? null : parentTitle!.toJson(),
        "previousEpisode": previousEpisode == null ? null : previousEpisode,
      };
}

class Image {
  Image({
    this.height,
    this.id,
    this.url,
    this.width,
  });

  int? height;
  String? id;
  String? url;
  int? width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"] == null ? null : json["height"],
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
      };
}

class ParentTitle {
  ParentTitle({
    this.id,
    this.image,
    this.title,
    this.titleType,
    this.year,
  });

  String? id;
  Image? image;
  String? title;
  String? titleType;
  int? year;

  factory ParentTitle.fromJson(Map<String, dynamic> json) => ParentTitle(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        title: json["title"] == null ? null : json["title"],
        titleType: json["titleType"] == null ? null : json["titleType"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image!.toJson(),
        "title": title == null ? null : title,
        "titleType": titleType == null ? null : titleType,
        "year": year == null ? null : year,
      };
}

class Principal {
  Principal({
    this.id,
    this.legacyNameText,
    this.name,
    this.category,
    this.characters,
    this.endYear,
    this.episodeCount,
    this.roles,
    this.startYear,
    this.billing,
    this.principalAs,
    this.disambiguation,
  });

  String? id;
  String? legacyNameText;
  String? name;
  String? category;
  List<String>? characters;
  int? endYear;
  int? episodeCount;
  List<Role>? roles;
  int? startYear;
  int? billing;
  String? principalAs;
  String? disambiguation;

  factory Principal.fromJson(Map<String, dynamic> json) => Principal(
        id: json["id"] == null ? null : json["id"],
        legacyNameText:
            json["legacyNameText"] == null ? null : json["legacyNameText"],
        name: json["name"] == null ? null : json["name"],
        category: json["category"] == null ? null : json["category"],
        characters: json["characters"] == null
            ? null
            : List<String>.from(json["characters"].map((x) => x)),
        endYear: json["endYear"] == null ? null : json["endYear"],
        episodeCount:
            json["episodeCount"] == null ? null : json["episodeCount"],
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        startYear: json["startYear"] == null ? null : json["startYear"],
        billing: json["billing"] == null ? null : json["billing"],
        principalAs: json["as"] == null ? null : json["as"],
        disambiguation:
            json["disambiguation"] == null ? null : json["disambiguation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "legacyNameText": legacyNameText == null ? null : legacyNameText,
        "name": name == null ? null : name,
        "category": category == null ? null : category,
        "characters": characters == null
            ? null
            : List<dynamic>.from(characters!.map((x) => x)),
        "endYear": endYear == null ? null : endYear,
        "episodeCount": episodeCount == null ? null : episodeCount,
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "startYear": startYear == null ? null : startYear,
        "billing": billing == null ? null : billing,
        "as": principalAs == null ? null : principalAs,
        "disambiguation": disambiguation == null ? null : disambiguation,
      };
}

class Role {
  Role({
    this.character,
    this.characterId,
  });

  String? character;
  String? characterId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        character: json["character"] == null ? null : json["character"],
        characterId: json["characterId"] == null ? null : json["characterId"],
      );

  Map<String, dynamic> toJson() => {
        "character": character == null ? null : character,
        "characterId": characterId == null ? null : characterId,
      };
}
