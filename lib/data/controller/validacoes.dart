class validacaoLogin {
  static String? validarNomeUsuario(String value) {
    if (value.isEmpty) {
      return 'Por favor, insira um nome de usuário';
    } else if (value.length < 6) {
      return 'O nome de usuário deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  static String? validarSenha(String value) {
    if (value.isEmpty) {
      return 'Por favor, insira uma senha';
    } else if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    } else if (!RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um caractere especial';
    }
    return null;
  }
}

class validacaoAddCliente{
  String? validarNome(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o nome';
    }
    return null;
  }

  String? validarEndereco(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o endereço';
    }
    return null;
  }

  String? validarTelefone(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o telefone';
    }
    return null;
  }

  String? validarImagemPerfil(String? valor) {
    if (valor == null || valor.isEmpty) {
      return null;
    }
    return null;
  }
}

class validacaoAddServico{
  String? validarDescicao(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o serviço';
    }
    return null;
  }
  String? validarValor(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor, insira o Valor';
    }
    return null;
  }
}
