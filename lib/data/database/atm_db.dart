import 'package:atm/data/database/database_service.dart';
import 'package:sqflite/sqflite.dart';


class AtmDB {
  final DatabaseService _dbService = DatabaseService();
  Future<Database> get database async {
    return await _dbService.database;
  }
  static const String tableClientes = 'clientes';
  static const String tableServicos = 'servicos';

  Future<void> create(Database database, int version)
  async{
    await createTable(database);
  }

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE $tableClientes(
        id INTEGER PRIMARY KEY,
        nome TEXT,
        endereco TEXT,
        telefone TEXT,
        imagemPerfil TEXT,
        deletado INTEGER DEFAULT 0
      )
    ''');

    await database.execute('''
      CREATE TABLE $tableServicos(
        id INTEGER PRIMARY KEY,
        descricao TEXT,
        valor REAL,
        clienteId INTEGER,
        deletado INTEGER DEFAULT 0,
        FOREIGN KEY(clienteId) REFERENCES $tableClientes(id)
      )
    ''');
  }

  Future<void> insertCliente(Map<String, dynamic> cliente) async {
    final db = await database;
    await db.insert(tableClientes, cliente);
  }

  Future<List<Map<String, dynamic>>> getClientes() async {
    final db = await database;
    return await db.query(
      tableClientes,
      where: 'deletado = ?',
      whereArgs: [0],
    );
  }

  Future<void> updateCliente(Map<String, dynamic> cliente) async {
    final db = await database;
    await db.update(
      tableClientes,
      cliente,
      where: 'id = ?',
      whereArgs: [cliente['id']],
    );
  }

  Future<void> deleteCliente(int id) async {
    final db = await database;
    await db.update(
      tableClientes,
      {'deletado': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertServico(Map<String, dynamic> servico) async {
    final db = await database;
    await db.insert(tableServicos, servico);
  }

  Future<List<Map<String, dynamic>>> getServicos() async {
    final db = await database;
    return await db.query(tableServicos);
  }

  Future<void> updateServico(Map<String, dynamic> servico) async {
    final db = await database;
    await db.update(
      tableServicos,
      servico,
      where: 'id = ?',
      whereArgs: [servico['id']],
    );
  }

  Future<void> deleteServico(int id) async {
    final db = await database;
    await db.delete(
      tableServicos,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

