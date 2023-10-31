import 'package:flutter/material.dart';



ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.light(
      background: Colors.white,
    )

);


ThemeData darktmode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
    )
);