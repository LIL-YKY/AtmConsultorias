import 'package:atm/data/controller/validacoes.dart';
import 'package:atm/ui/components/my_elevatedButton.dart';
import 'package:atm/ui/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

import '../../data/controller/clientesController.dart';
import '../../data/models/cliente.dart';

class AdicionarCliente extends StatelessWidget {
  final Cliente? cliente;
  final nomeController = TextEditingController();
  final enderecoController = TextEditingController();
  final telefoneController = MaskedTextController(mask: '(00) 00000-0000');
  final imagemPerfilController = TextEditingController();

  AdicionarCliente({this.cliente}) {
    if (cliente != null) {
      nomeController.text = cliente?.nome ?? '';
      enderecoController.text = cliente?.endereco ?? '';
      telefoneController.text = cliente?.telefone ?? '';
      imagemPerfilController.text = cliente?.imagemPerfil ?? '';
    }
  }

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
            buildTextField(nomeController, "Nome"),
            buildTextField(enderecoController, "Endereco"),
            buildTextField(telefoneController, "Telefone"),
            buildTextField(imagemPerfilController, "Imagem de Perfil (Link)"),
            SizedBox.fromSize(size:Size(0, 25)),
            buildSaveButton(context)
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return MyTextField2(
      controller: controller,
      hintText: '',
      labelText: label,
      obscureText: false,
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return MyElevatedButtonSalvar(
        funcao: (){
          _Salvar(context);
        }
    );
  }

  _Salvar(context) {
    var validacao = validacaoAddCliente();

    String? nomeCliente = validacao.validarNome(nomeController.text);
    String? enderecoCliente = validacao.validarEndereco(enderecoController.text);
    String? telefoneCliente = validacao.validarTelefone(telefoneController.text);
    String? imagemCliente = validacao.validarImagemPerfil(imagemPerfilController.text);

    if (nomeCliente != null || enderecoCliente != null || telefoneCliente != null || imagemCliente != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(nomeCliente ?? enderecoCliente ?? telefoneCliente ?? imagemCliente ?? '')),
      );
    } else {
      // Se o link da imagem for nulo ou vazio, use o link padrão
      String imagemPerfil = imagemPerfilController.text.isEmpty ? 'https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331256_1280.png' : imagemPerfilController.text;

      var novoCliente = Cliente(
        id: cliente?.id ?? 0, // Use o id do cliente existente, se houver
        nome: nomeController.text,
        endereco: enderecoController.text,
        telefone: telefoneController.text,
        imagemPerfil: imagemPerfil,
        deletado: 0,
      );

      // Obter o ClienteController
      final ClienteController clientesController = Get.find();

      if (cliente != null) {
        // Atualizar o cliente existente
        clientesController.updateCliente(novoCliente);
      } else {
        // Adicionar o novo cliente
        clientesController.addCliente(novoCliente);
      }

      Navigator.pop(context);
    }
  }
}
