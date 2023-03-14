import 'package:flutter/material.dart';

double height = 0;
double width = 0;

size(context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
}
