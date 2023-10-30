import 'package:sqflite/sqflite.dart';


class AtmDB {
  static const String tableClientes = 'clientes';
  static const String tableServicos = 'servicos';

  Future<void> create(Database database, int version) async{
    await AtmDB().createTable(database);
  }

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE $tableClientes(
        id INTEGER PRIMARY KEY,
        nome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');

    await database.execute('''
      CREATE TABLE $tableServicos(
        id INTEGER PRIMARY KEY,
        descricao TEXT,
        valor REAL,
        clienteId INTEGER,
        FOREIGN KEY(clienteId) REFERENCES $tableClientes(id)
      )
    ''');
  }
}
