import 'package:atm/ui/components/my_elevatedButton.dart';
import 'package:atm/ui/pages/telaAddServico.dart';
import 'package:flutter/material.dart';
import 'telaAddCliente.dart';

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
        backgroundColor: Colors.black,
        title: Text("Serviços"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){

              return ListTile(
                onTap: (){
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
                            MyElevatedButton2(
                            texto: "Sim",
                            funcao:  (){
                              print("Selecionado sim");
                              Navigator.pop(context);
                            },
                          ),
                            MyElevatedButton2(
                                texto: "Não",
                                funcao:  (){
                                  print("Selecionado nao");
                                  Navigator.pop(context);
                                },
                            ),
                          ],
                        );
                      }
                  );
                },
                title: Text( _itens[indice]["titulo"] ),
                subtitle: Text( _itens[indice]["descricao"] ),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AdicionarServico()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
      ),
    );
  }
}
