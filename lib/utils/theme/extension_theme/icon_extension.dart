
import 'package:flutter/material.dart';
import '../app_colors/all_colors_export.dart';
import '../extend_theme/icon_theme_extend.dart';

//light
final iconThemeLightExtension = IconThemeExtend(
  iconThemes: const[
    IconThemeData(
      color: appPrimaryColor,
      opacity: 0.8,
    ),
    IconThemeData(
      color: blackOnly,
      opacity: 0.8,
    ),
    IconThemeData(
      color: whiteOnly,
      opacity: 0.8,
    ),
    IconThemeData(
      color: appPrimaryColor,
      opacity: 0.8,
    ),
    IconThemeData(
      color: appRedColor,
      opacity: 0.8,
    ),
  ]
);

//dark
final iconThemDarkExtension =  IconThemeExtend(
    iconThemes: const[
      IconThemeData(
        color: appPrimaryColor,
        opacity: 0.8,
      ),
      IconThemeData(
        color: whiteOnly,
        opacity: 0.8,
      ),
      IconThemeData(
        color: appPrimaryColor,
        opacity: 0.8,
      ),
      IconThemeData(
        color: appPrimaryColor,
        opacity: 0.8,
      ),
      IconThemeData(
        color: appPrimaryColor,
        opacity: 0.8,
      ),
    ]
);