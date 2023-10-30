import 'package:atm/components/cliente_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ClientesController.dart';

class TelaCliente extends StatelessWidget {
  const TelaCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientesController clientesController = Get.put(ClientesController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Lista de Clientes")),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: GetX<ClientesController>(
          builder: (clientesController) {
            return ListView.builder(
                itemCount: clientesController.count,
                itemBuilder: (ctx,i) => ClienteTile(clientesController.byIndex(i))
            );
          }
      ),
    );
  }
}
