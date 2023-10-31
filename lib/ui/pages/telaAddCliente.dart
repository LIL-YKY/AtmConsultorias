import 'package:atm/data/controller/validacoes.dart';
import 'package:atm/ui/components/my_elevatedButton.dart';
import 'package:atm/ui/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/clientesController.dart';
import '../../data/models/cliente.dart';

class AdicionarCliente extends StatelessWidget {
  final nomeController = TextEditingController();
  final enderecoController = TextEditingController();
  final telefoneController = TextEditingController();
  final imagemPerfilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cliente'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            MyTextField2(
              controller: nomeController,
              hintText: '',
              labelText: "Nome",
              obscureText: false,
            ),
            MyTextField2(
              controller: enderecoController,
              hintText: '',
              labelText: "Endereco",
              obscureText: false,
            ),
            MyTextField2(
              controller: telefoneController,
              hintText: '',
              labelText: "Telefone",
              obscureText: false,
            ),
            MyTextField2(
              controller: imagemPerfilController,
              hintText: '',
              labelText: "Imagem de Perfil (Link)",
              obscureText: false,
            ),
            SizedBox.fromSize(size:Size(0, 25)),
            MyElevatedButtonSalvar(
                funcao: (){
                  _Salvar(context);
                }
            )
          ],
        ),
      ),
    );
  }
  _Salvar(context) {
    var validacao = validacaoAddCliente();

    String? nomeCliente = validacao.validarNome(nomeController.text);
    String? telefoneCliente = validacao.validarTelefone(telefoneController.text);
    String? enderecoCliente = validacao.validarEndereco(enderecoController.text);
    String? imagemCliente = validacao.validarImagemPerfil(imagemPerfilController.text);

    String? erro;
    if (nomeCliente != "correto") {
      erro = nomeCliente;
    } else if (telefoneCliente != "correto") {
      erro = telefoneCliente;
    } else if (enderecoCliente != "correto") {
      erro = enderecoCliente;
    } else if (imagemCliente != "correto") {
      erro = imagemCliente;
    }

    if (erro != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erro)),
      );
    } else {
      var novoCliente = Cliente(
        id: 0, // O id será gerado automaticamente pelo banco de dados
        nome: nomeController.text,
        endereco: enderecoController.text,
        telefone: telefoneController.text,
        imagemPerfil: imagemPerfilController.text,
        deletado: 0,
      );

      // Obter o ClienteController
      final ClienteController clientesController = Get.find();

      // Adicionar o novo cliente
      clientesController.addCliente(novoCliente);
      Navigator.pop(context);
    }
  }

}
