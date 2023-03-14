import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesModel {
  String body;
  String cover;
  Timestamp createdOn;
  String lang;
  String title;

  ArticlesModel({
    this.body,
    this.cover,
    this.createdOn,
    this.lang,
    this.title,
  });

  factory ArticlesModel.fromMap(Map<String, dynamic> map) => ArticlesModel(
        body: map['body'],
        cover: map['cover'],
        createdOn: map['created_on'],
        lang: map['lang'],
        title: map['title'],
      );

  Map<String, dynamic> meditationsMap() {
    return {
      'body': body,
      'cover': cover,
      'created_on': createdOn,
      'lang': lang,
      'title': title,
    };
  }
}
