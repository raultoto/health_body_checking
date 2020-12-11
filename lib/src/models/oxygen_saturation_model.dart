import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

OxygenSaturationModel oxygenSaturationModelFromJson(String str) => OxygenSaturationModel.fromJson(json.decode(str));

String oxygenSaturationModelToJson(OxygenSaturationModel data) => json.encode(data.toJson());

class OxygenSaturationModel {
    OxygenSaturationModel({
        this.id,
        this.userId,
        this.saturation,
        this.time,
    });

    String id;
    String userId;
    double saturation;
    Timestamp time;

    factory OxygenSaturationModel.fromJson(Map<String, dynamic> json) => OxygenSaturationModel(
        id: json["id"],
        userId: json["user_id"],
        saturation: json["saturation"].toDouble(),
        time: json["time"],
    );
    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "saturation": saturation,
        "time": time,
    };
}