// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

import 'package:chat_app/entities/message.dart';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  String answer;
  bool forced;
  String image;

  RequestModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message parseMessage() {
    return Message(
      text: answer,
      imageUrl: image,
      fromWho: FromWho.friend,
    );
  }
}
