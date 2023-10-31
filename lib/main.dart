import 'package:atm/ui/pages/home.dart';
import 'package:atm/ui/pages/telaLogin.dart';
import 'package:atm/ui/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:atm/data/controller/appController.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'data/database/database_service.dart';

Future<void> main() async {
  // Cria uma instância do AppController
  final AppController appController = Get.put(AppController());
  WidgetsFlutterBinding.ensureInitialized();

  // Obter o caminho completo do banco de dados
  final path = await fullPath;

  // Inicialize o serviço de banco de dados
  DatabaseService dbService = DatabaseService();

  // Crie o banco de dados
  await dbService.database;

  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: lightmode,
    darkTheme: darktmode,
  ));
}
