import 'package:atm/pages/Home.dart';
import 'package:atm/pages/Login.dart';
import 'package:atm/theme/tema.dart';
import 'package:flutter/material.dart';
import 'controller/AppController.dart';
import 'package:get/get.dart';

void main(){
  // Cria uma instância do AppController
  final AppController appController = Get.put(AppController());
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: lightmode,
    darkTheme: darktmode,
  ));
}
