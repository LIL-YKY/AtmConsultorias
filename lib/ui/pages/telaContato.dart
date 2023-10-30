import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  final String? valor;
  const TelaContato({Key? key, this.valor}) : super(key: key);

  @override
  State<TelaContato> createState() => _TelaContatoState();
}


class _TelaContatoState extends State<TelaContato> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Contatos"),
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
                    Image.asset("lib/ui/images/detalhe_contato.png"),
                    Padding(padding: EdgeInsets.only(left: 32),
                      child: Text("Contatos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 32),
              child:  Text("Email: example@example.com",
                style: TextStyle(fontSize: 18 ),
              ),
              ),
              Padding(padding: EdgeInsets.only(top: 16),
              child: Text("Telefone: +55 (46) 3225-5555",
                style: TextStyle(fontSize: 18),
              ),
              ),
              Padding(padding: EdgeInsets.only(top: 16),
                child: Text("Celular: +55 (46) 99999-9999 ${widget.valor}",
                  style: TextStyle(fontSize: 18,),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16),
                child: Text("App desenvolvido por: ${widget.valor}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
