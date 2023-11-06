import 'package:atm/ui/pages/TelaClienteDeatalhes.dart';
import 'package:atm/ui/pages/telaAddCliente.dart';
import 'package:flutter/material.dart';
import 'package:atm/data/models/cliente.dart';
import 'package:atm/data/controller/clientesController.dart';
import 'package:get/get.dart';

class ClienteTile extends StatelessWidget {
  final Cliente cliente;

  const ClienteTile(this.cliente);

  @override
  Widget build(BuildContext context) {
    // Obtenha a instância do ClienteController
    final ClienteController clientesController = Get.find();

    final avatar = cliente.imagemPerfil == null || cliente.imagemPerfil.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(cliente.imagemPerfil));

    return ListTile(
      leading: avatar,
      title: Text(cliente.nome),
      subtitle: Text(cliente.endereco),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdicionarCliente(cliente: cliente)));
            },
            icon: Icon(Icons.edit),
            color: Colors.orange,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmação'),
                    content: Text('Você tem certeza que deseja excluir este cliente?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Excluir'),
                        onPressed: () {
                          clientesController.deleteCliente(cliente);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
          )
        ]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClienteDetails(cliente)),
        );
      },
    );
  }
}
