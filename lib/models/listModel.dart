import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';

class Patient {
  final name;
  final wardNo;
  final id;
  final numberHeart;
  final numberPressure;
  final numberFever;
  List <Category> categories = [];
  Patient({
   @required this.name, 
   @required  this.wardNo,
   @required this.id,
   @required this.numberHeart,
  @required this.numberPressure,
   @required this.numberFever,
   });
}

class Category{

  final title;
  final numberr;
  final icons;
  final id;
  Category({this.title, this.numberr, this.icons, this.id});
}