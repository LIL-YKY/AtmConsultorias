import 'package:get/get.dart';
import 'package:atm/data/models/cliente.dart';
import 'package:atm/data/database/atm_db.dart';
import 'package:atm/data/database/database_service.dart';


class ClienteController extends GetxController {
  // Criar uma lista observável de clientes
  var clientes = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchClientes();
  }

  void fetchClientes() async {
    var dbClient = await DatabaseService().database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Clientes');
    list.forEach((element) {
      clientes.add(Cliente.fromMap(element.cast<String, dynamic>()));
    });
  }

  void addCliente(Cliente cliente) async {
    var dbClient = await DatabaseService().database;
    cliente.id = await dbClient.insert('Clientes', cliente.toMap());
    clientes.add(cliente);
  }

  void updateCliente(Cliente cliente) async {
    var dbClient = await DatabaseService().database;
    await dbClient.update(
      'Clientes',
      cliente.toMap(),
      where: 'id = ?',
      whereArgs: [cliente.id],
    );

    int index = clientes.indexWhere((c) => c.id == cliente.id);
    if (index != -1) {
      clientes[index] = cliente;
    }
  }

  void deleteCliente(Cliente cliente) async {
    var dbClient = await DatabaseService().database;
    await dbClient.update(
      'Clientes',
      {'deletado': 1},
      where: 'id = ?',
      whereArgs: [cliente.id],
    );

    int index = clientes.indexWhere((c) => c.id == cliente.id);
    if (index != -1) {
      clientes[index].deletado = 1;
    }
  }

}
