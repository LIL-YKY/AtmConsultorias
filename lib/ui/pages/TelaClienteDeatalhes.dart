import 'package:atm/data/models/cliente.dart';
import 'package:flutter/material.dart';


class ClienteDetails extends StatelessWidget {
  final Cliente cliente;

  const ClienteDetails(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome: ${cliente.nome}', style: TextStyle(fontSize: 24)),
            Text('Endereço: ${cliente.endereco}', style: TextStyle(fontSize: 24)),
            Text('Telefone: ${cliente.telefone}', style: TextStyle(fontSize: 24)),
            // Adicione mais campos conforme necessário
          ],
        ),
      ),
    );
  }
}
