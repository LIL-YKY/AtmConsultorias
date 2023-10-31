import 'package:atm/ui/components/my_elevatedButton.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class AdicionarServico extends StatelessWidget {
  final descricaoController = TextEditingController();
  final valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Serviço'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            MyTextField2(
              controller: descricaoController,
              hintText: '',
              labelText: "Telefone",
              obscureText: false,
            ),
            MyTextField2(
              controller: valorController,
              hintText: '',
              labelText: "Valor",
              obscureText: false,
            ),
            SizedBox.fromSize(size:Size(0, 25)),
            MyElevatedButtonSalvar(
                funcao:() {
                  print('Salvo');
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
