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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(cliente.imagemPerfil);
                    }));
                  },
                  child: ClipOval(
                    child: Container(
                      width: 300, // largura fixa
                      height: 300, // altura fixa
                      child: Image.network(cliente.imagemPerfil, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text('Nome: ${cliente.nome}', style: TextStyle(fontSize: 22)),
              Text('Endereço: ${cliente.endereco}', style: TextStyle(fontSize: 22)),
              Text('Telefone: ${cliente.telefone}', style: TextStyle(fontSize: 22)),
              // Adicione mais campos conforme necessário
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  DetailScreen(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      body: GestureDetector(
        child: Center(
          child: Image.network(imageUrl),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
