import 'package:get/get.dart';
import 'package:atm/data/dummy_cliente.dart';
import '../models/Cliente.dart';

class ClientesController extends GetxController {
  final _items = RxList<Cliente>(DUMMY_CLIENTES.values.toList());

  List<Cliente> get all => _items;

  int get count => _items.length;

}
