import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {

  List _itens = [];

  void _carregarItens(){

    _itens = [];
    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Serviço ${i} ";
      item["descricao"] = "Descrição ${i} O serviço prestado.";
      _itens.add( item );

    }

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){

              //Map<String, dynamic> item = _itens[indice];
              //print("item ${ _itens[indice]["titulo"] }");

              return ListTile(
                onTap: (){
                  //print("clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text( _itens[indice]["titulo"] ),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.orange
                          ),
                          content: Text( _itens[indice]["descricao"] ),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: (){
                                  print("Selecionado sim");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  print("Selecionado nao");
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            )
                          ],
                          //backgroundColor: Colors.orange,
                        );
                      }
                  );
                },
                /*onLongPress: (){
                  print("clique com onLongPress");
                },*/
                title: Text( _itens[indice]["titulo"] ),
                subtitle: Text( _itens[indice]["descricao"] ),
              );
            }
        ),
      ),
    );
  }
}