import 'package:flutter/material.dart';
import '../app_colors/all_colors_export.dart';
import '../extend_theme/container_theme_extend.dart';

// Container Light Theme Extension
final containerThemeLightExtension = ContainerThemeExtend(
  containerBackgroundBoarderBoxShadowColorList: const [
    //background, boarder, shadowColor(primary, none, _)--0
    [appPrimaryColor, Color(0xff0057A3), Color(0xff000000)],
    //background, boarder(secondary, none)--1
    [appSecondaryColor, Color(0xff008080), Color(0xff000000)],
    //background, boarder(white, none)--2
    [whiteOnly, Color(0xffffffff), Color(0xff000000)],
    //background, boarder(white, yellow type)--3
    [whiteOnly, appOrangeColor, Color(0xff000000)],
  ],
);

// Container Dark Theme Extension
final containerThemeDarkExtension = ContainerThemeExtend(
  containerBackgroundBoarderBoxShadowColorList:  [
    //background, boarder, shadowColor(primary, none, _)--0
    const [Color(0xff0057A3), Color(0xff0057A3), Color(0xffb13737)],
    //background, boarder(secondary, none)--1
    const [containerBackGroundColorDark, containerBoarderColorDark, Color(0xffc33434)],
    //background, boarder(white, none)--2
    const [containerBackGroundColorDark, containerBoarderColorDark, Color(0xff000000)],
    //background, boarder(white, orange type)--3
    const [containerBackGroundColorDark, appOrangeColor, Color(0xffa83131)],
  ],
);
