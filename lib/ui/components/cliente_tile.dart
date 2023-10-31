import 'package:flutter/material.dart';
import 'package:atm/data/models/cliente.dart';
import 'package:atm/data/controller/clientesController.dart';

class ClienteTile extends StatelessWidget {
  final Cliente cliente;

  const ClienteTile(this.cliente);

  @override
  Widget build(BuildContext context) {
    ClienteController clientesController;
    final avatar= cliente.imagemPerfil == null || cliente.imagemPerfil.isEmpty ? CircleAvatar(child: Icon(Icons.person))
        :CircleAvatar(backgroundImage: NetworkImage(cliente.imagemPerfil));
    return ListTile(
      leading: avatar,
      title: Text(cliente.nome),
      subtitle: Text(cliente.endereco),
      trailing: Container(
        width: 100,
        child: Row( children: <Widget>[
         IconButton(
            onPressed: (){},
            icon: Icon(Icons.edit),
            color: Colors.orange,
        ),
         IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
        ),
        ],
      ),
      ),
    );
  }
}

