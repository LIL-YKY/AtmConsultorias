import 'package:flutter/material.dart';
import 'package:atm/ui/pages/configuracao.dart';

import '../pages/telaLogin.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Kayky Mendes"),
              accountEmail: Text("ykytecnicoinformatica@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network("https://mir-s3-cdn-cf.behance.net/project_modules/disp/93b76112841839.5626e0ac458b9.jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage("https://th.bing.com/th/id/R.265f8e3775a948efbf3a8644a787ac17?rik=w54mv%2b%2bFlYkCoA&pid=ImgRaw&r=0"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favoritos"),
              onTap: ()=> null,
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Amigos"),
              onTap: ()=> null,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Compartilhar"),
              onTap: ()=> null,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notificações"),
              onTap: ()=> null,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configuraçoes"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Configuracao(title: 'Configurações',)));
              }
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text("Politicas"),
              onTap: ()=> null,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                },
            ),
          ],
      ),
    );
  }
}
