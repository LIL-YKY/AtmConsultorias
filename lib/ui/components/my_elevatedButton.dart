import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String texto;
  final VoidCallback funcao;
  final Color corCima;
  final Color corFundo;

  const MyElevatedButton({
    Key? key,
    required this.texto,
    required this.funcao,
    required this.corCima,
    required this.corFundo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcao,
      child: Text(texto),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(corFundo),
        foregroundColor: MaterialStateProperty.all(corCima),
      ),
    );
  }
}
class MyElevatedButton2 extends StatelessWidget {
  final String texto;
  final VoidCallback funcao;

  const MyElevatedButton2({
    Key? key,
    required this.texto,
    required this.funcao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcao,
      child: Text(texto),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }
}


class MyElevatedButtonSalvar extends StatelessWidget {
  final VoidCallback funcao;

  const MyElevatedButtonSalvar({
    Key? key,
    required this.funcao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcao,
      child: Text("Salvar"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }
}