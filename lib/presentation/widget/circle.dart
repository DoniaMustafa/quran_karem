import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/styel.dart';

Widget circle({required String? data})=>CircleAvatar(
  radius: 20.0,
  backgroundColor:transparentBlack ,
  child: Text(data!,
    style:white18bold() ,),
);