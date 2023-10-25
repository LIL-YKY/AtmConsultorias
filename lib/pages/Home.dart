import 'package:atm/components/NavBar.dart';
import 'package:atm/pages/TelaCliente.dart';
import 'package:atm/pages/TelaContato.dart';
import 'package:atm/pages/TelaEmpresa.dart';
import 'package:atm/pages/TelaServico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirEmpresa(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaEmpresa()));
  }
  void _abrirServico(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaServico()));
  }
  void _abrirCliente(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaCliente()));
  }
  void _abrirContato(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TelaContato(valor: "Kayky Mendes")));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text("ATM Consultoria"))
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("lib/images/logo.png"),
            Padding(padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: _abrirEmpresa,
                      child: Image.asset("lib/images/menu_empresa.png"),
                    ),
                    GestureDetector(
                      onTap: _abrirServico,
                      child: Image.asset("lib/images/menu_servico.png"),
                    )
                  ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirCliente,
                    child: Image.asset("lib/images/menu_cliente.png"),
                  ),
                  GestureDetector(
                    onTap: _abrirContato,
                    child: Image.asset("lib/images/menu_contato.png"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
