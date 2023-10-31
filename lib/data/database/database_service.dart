import 'package:atm/data/database/atm_db.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseService{
  Database? _database;

  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }
  void dispose() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}

Future<String> get fullPath async{
  const name ='atm.db';
  final path = await getDatabasesPath();
  return join(path, name);
}

Future<Database> _initialize() async{
  final path = await fullPath;
  var database = await openDatabase(
    path,
    version: 1,
    onCreate: create,
    singleInstance: true,
  );
  return database;
}

Future<void> create(Database database, int version) async =>
    await AtmDB().createTable(database);