// To parse this JSON data, do
//
//     final tournamentGroup = tournamentGroupFromJson(jsonString);

import 'dart:convert';

List<TournamentGroup> tournamentGroupFromJson(String str) =>
    List<TournamentGroup>.from(
        json.decode(str).map((x) => TournamentGroup.fromJson(x)));

String tournamentGroupToJson(List<TournamentGroup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TournamentGroup {
  TournamentGroup({
    required this.id,
    required this.name,
    required this.priority,
    required this.url,
    required this.meta,
    required this.tournaments,
    required this.blockEnroll,
  });

  final int id;
  final String name;
  final int priority;
  final String url;
  final TournamentGroupMeta meta;
  final List<Tournament> tournaments;
  final bool? blockEnroll;

  factory TournamentGroup.fromJson(Map<String, dynamic> json) =>
      TournamentGroup(
        id: json["id"],
        name: json["name"],
        priority: json["priority"],
        url: json["url"],
        meta: TournamentGroupMeta.fromJson(json["meta"]),
        tournaments: List<Tournament>.from(
            json["tournaments"].map((x) => Tournament.fromJson(x))),
        blockEnroll: json["block_enroll"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "priority": priority,
        "url": url,
        "meta": meta.toJson(),
        "tournaments": List<dynamic>.from(tournaments.map((x) => x.toJson())),
        "block_enroll": blockEnroll,
      };
}

class TournamentGroupMeta {
  TournamentGroupMeta({
    required this.ui,
  });

  final PurpleUi ui;

  factory TournamentGroupMeta.fromJson(Map<String, dynamic> json) =>
      TournamentGroupMeta(
        ui: PurpleUi.fromJson(json["ui"]),
      );

  Map<String, dynamic> toJson() => {
        "ui": ui.toJson(),
      };
}

class PurpleUi {
  PurpleUi({
    required this.blockedText,
  });

  final BlockedText blockedText;

  factory PurpleUi.fromJson(Map<String, dynamic> json) => PurpleUi(
        blockedText: BlockedText.fromJson(json["blocked_text"]),
      );

  Map<String, dynamic> toJson() => {
        "blocked_text": blockedText.toJson(),
      };
}

class BlockedText {
  BlockedText({
    required this.text,
    required this.style,
  });

  final TextLanguage text;
  final String style;

  factory BlockedText.fromJson(Map<String, dynamic> json) => BlockedText(
        text: TextLanguage.fromJson(json["text"]),
        style: json["style"],
      );

  Map<String, dynamic> toJson() => {
        "text": text.toJson(),
        "style": style,
      };
}

class TextLanguage {
  TextLanguage({
    required this.ro,
    required this.en,
  });

  final String ro;
  final String en;

  factory TextLanguage.fromJson(Map<String, dynamic> json) => TextLanguage(
        ro: json["ro"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ro": ro,
        "en": en,
      };
}

class Tournament {
  Tournament({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.enrolled,
    required this.activated,
    required this.missionGroupId,
    required this.meta,
  });

  final int id;
  final String name;
  final int startDate;
  final int endDate;
  final bool enrolled;
  final bool activated;
  final int missionGroupId;
  final TournamentMeta meta;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        id: json["id"],
        name: json["name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        enrolled: json["enrolled"],
        activated: json["activated"],
        missionGroupId: json["mission_group_id"],
        meta: TournamentMeta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start_date": startDate,
        "end_date": endDate,
        "enrolled": enrolled,
        "activated": activated,
        "mission_group_id": missionGroupId,
        "meta": meta.toJson(),
      };
}

class TournamentMeta {
  TournamentMeta({
    required this.ui,
    required this.games,
    required this.recommended,
    required this.levels,
  });

  final FluffyUi ui;
  final List<int> games;
  final List<int> recommended;
  final int levels;

  factory TournamentMeta.fromJson(Map<String, dynamic> json) => TournamentMeta(
        ui: FluffyUi.fromJson(json["ui"]),
        games: List<int>.from(json["games"].map((x) => x)),
        recommended: List<int>.from(json["recommended"].map((x) => x)),
        levels: json["levels"],
      );

  Map<String, dynamic> toJson() => {
        "ui": ui.toJson(),
        "games": List<dynamic>.from(games.map((x) => x)),
        "recommended": List<dynamic>.from(recommended.map((x) => x)),
        "levels": levels,
      };
}

class FluffyUi {
  FluffyUi({
    required this.prize1,
    required this.prize2,
    required this.rules,
    required this.cornerImage,
    required this.currentPlaceImage,
    required this.gamesImage,
    required this.objectivesImage,
    required this.scoresImage,
    required this.topImage,
  });

  final BlockedText prize1;
  final BlockedText prize2;
  final BlockedText rules;
  final ImageModel cornerImage;
  final ImageModel currentPlaceImage;
  final ImageModel gamesImage;
  final ImageModel objectivesImage;
  final ImageModel scoresImage;
  final ImageModel topImage;

  factory FluffyUi.fromJson(Map<String, dynamic> json) => FluffyUi(
        prize1: BlockedText.fromJson(json["prize_1"]),
        prize2: BlockedText.fromJson(json["prize_2"]),
        rules: BlockedText.fromJson(json["rules"]),
        cornerImage: ImageModel.fromJson(json["corner_image"]),
        currentPlaceImage: ImageModel.fromJson(json["current_place_image"]),
        gamesImage: ImageModel.fromJson(json["games_image"]),
        objectivesImage: ImageModel.fromJson(json["objectives_image"]),
        scoresImage: ImageModel.fromJson(json["scores_image"]),
        topImage: ImageModel.fromJson(json["top_image"]),
      );

  Map<String, dynamic> toJson() => {
        "prize_1": prize1.toJson(),
        "prize_2": prize2.toJson(),
        "rules": rules.toJson(),
        "corner_image": cornerImage.toJson(),
        "current_place_image": currentPlaceImage.toJson(),
        "games_image": gamesImage.toJson(),
        "objectives_image": objectivesImage.toJson(),
        "scores_image": scoresImage.toJson(),
        "top_image": topImage.toJson(),
      };
}

class ImageModel {
  ImageModel({
    required this.url,
    required this.style,
  });

  final String url;
  final String style;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
        style: json["style"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "style": style,
      };
}
