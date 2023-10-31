import 'package:atm/ui/components/cliente_tile.dart';
import 'package:atm/ui/pages/telaAddCliente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:atm/data/controller/clientesController.dart';

class TelaCliente extends StatelessWidget {
  const TelaCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClienteController clientesController = Get.put(ClienteController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Lista de Clientes")),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdicionarCliente()
            ));
            },
              icon: Icon(Icons.add))
        ],
      ),
      body: GetX<ClienteController>(
          builder: (clientesController) {
            return ListView.builder(
                itemCount: clientesController.clientes.length,
                itemBuilder: (ctx,i) => ClienteTile(clientesController.clientes[i])
            );
          }
      ),
    );
  }
}
