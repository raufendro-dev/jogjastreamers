// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Station> stations;

  Welcome({
    required this.stations,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        stations: List<Station>.from(
            json["stations"].map((x) => Station.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
      };
}

class Station {
  String radioId;
  String radioName;
  String radioImage;
  String radioUrl;
  String genre;
  String countryId;
  String countryName;
  String countryFlag;

  Station({
    required this.radioId,
    required this.radioName,
    required this.radioImage,
    required this.radioUrl,
    required this.genre,
    required this.countryId,
    required this.countryName,
    required this.countryFlag,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        radioId: json["radio_id"],
        radioName: json["radio_name"],
        radioImage: json["radio_image"],
        radioUrl: json["radio_url"],
        genre: json["genre"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryFlag: json["country_flag"],
      );

  Map<String, dynamic> toJson() => {
        "radio_id": radioId,
        "radio_name": radioName,
        "radio_image": radioImage,
        "radio_url": radioUrl,
        "genre": genre,
        "country_id": countryId,
        "country_name": countryName,
        "country_flag": countryFlag,
      };
}
