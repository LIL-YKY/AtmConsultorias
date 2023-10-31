class Cliente {
  int id;
  String nome;
  String endereco;
  String telefone;
  String imagemPerfil;
  int deletado;

  Cliente({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.telefone,
    required this.imagemPerfil,
    required this.deletado,
  });

  // Converter um Cliente em um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
      'imagemPerfil': imagemPerfil,
      'deletado': deletado,
    };
  }

  // Converter um Map em um Cliente
  Cliente.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        endereco = map['endereco'],
        telefone = map['telefone'],
        imagemPerfil = map['imagemPerfil'],
        deletado = map['deletado'];
}