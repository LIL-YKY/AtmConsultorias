import 'package:atm/ui/pages/home.dart';
import 'package:atm/ui/pages/telaLogin.dart';
import 'package:atm/ui/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:atm/data/controller/appController.dart';
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
