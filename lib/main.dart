import 'package:atm/pages/Home.dart';
import 'package:atm/pages/Login.dart';
import 'package:atm/theme/tema.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: lightmode,
    darkTheme: darktmode,
  ));
}
