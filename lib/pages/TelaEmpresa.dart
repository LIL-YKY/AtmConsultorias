import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({super.key});


  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Empresa"),
    ),
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 16),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Image.asset("lib/images/detalhe_empresa.png"),
                Padding(padding: EdgeInsets.only(left: 32),
                 child: Text("Sobre a Empresa", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                ),
              ],
              ),
            ),
              Padding(padding: EdgeInsets.only(top: 32),
                child: Text("A empresa de consultoria ATM é uma referência no mercado de soluções estratégicas para negócios. Com uma equipe de profissionais qualificados e experientes, oferecemos serviços personalizados e de alta qualidade para atender às necessidades e aos objetivos dos nossos clientes. Nossa missão é contribuir para o crescimento e a competitividade das organizações, através de diagnósticos precisos, análises de cenários, planejamento estratégico, implementação de projetos e acompanhamento de resultados. Nossa visão é ser reconhecida como uma empresa de excelência em consultoria, que agrega valor e gera soluções inovadoras para os desafios do mercado. Nossos valores são: ética, comprometimento, transparência, respeito, qualidade e inovação.",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
              ),
            ],
      ),
      ),
      ),
    );
  }
}
