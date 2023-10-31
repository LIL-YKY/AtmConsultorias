class validacaoLogin {
  static String validarNomeUsuario(String value) {
    if (value.isEmpty) {
      return 'Por favor, insira um nome de usuário';
    } else if (value.length < 6) {
      return 'O nome de usuário deve ter pelo menos 6 caracteres';
    }
    return 'correto';
  }

  static String validarSenha(String value) {
    if (value.isEmpty) {
      return 'Por favor, insira uma senha';
    } else if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    } else if (!RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um caractere especial';
    }
    return 'correto';
  }
}

class validacaoAddCliente{
  String validarNome(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o nome';
    }
    return "correto";
  }

  String validarEndereco(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o endereço';
    }
    return "correto";
  }

  String validarTelefone(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o telefone';
    }
    return "correto";
  }

  String validarImagemPerfil(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o link da imagem de perfil';
    }
    return "correto";
  }
}

class validacaoAddServico{
  String validarDescicao(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o serviço';
    }
    return "correto";
  }
  String validarValor(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o Valor';
    }
    return "correto";
  }
}
