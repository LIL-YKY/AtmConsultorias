import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configuracao extends StatefulWidget {
  Configuracao({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ConfiguracaoState createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  late SharedPreferences prefs;
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;
      _switchValue1 = prefs.getBool('switch_value_1') ?? false;
      _switchValue2 = prefs.getBool('switch_value_2') ?? false;
      _switchValue3 = prefs.getBool('switch_value_3') ?? false;
      setState(() {});
    });
  }

  void _onSwitchChanged(bool value, String key) async {
    setState(() {
      switch (key) {
        case 'switch_value_1':
          _switchValue1 = value;
          break;
        case 'switch_value_2':
          _switchValue2 = value;
          break;
          case 'switch_value_3':
        _switchValue3 = value;
        break;
      }
    });
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('Configuração da Conta')),
          SwitchListTile(
            title: const Text('Notificações por e-mail'),
            value: _switchValue1,
            onChanged: (bool value) {
              _onSwitchChanged(value, 'switch_value_1');
            },
          ),
          ListTile(title: Text('Configuração de Privacidade')),
          SwitchListTile(
            title: const Text('Compartilhar dados de uso'),
            value: _switchValue2,
            onChanged: (bool value) {
              _onSwitchChanged(value, 'switch_value_2');
            },
          ),
          SwitchListTile(
            title: const Text('Modo escuro'),
            value: _switchValue3,
            onChanged: (bool value) {
              _onSwitchChanged(value, 'switch_value_3');
            },
          )
        ],
      ),
    );
  }
}
