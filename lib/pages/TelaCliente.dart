import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({super.key});

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Clientes"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("lib/images/detalhe_cliente.png"),
                    Padding(padding: EdgeInsets.only(left: 32),
                      child: Text("Clientes", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 32),
                child: Image.asset("lib/images/cliente1.png"),
              ),
                Text("Empresa de Softfware",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              Padding(padding: EdgeInsets.only(top: 32),
                child: Image.asset("lib/images/cliente2.png"),
              ),
              Text("Empresa de Auditoria",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
