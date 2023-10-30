class Validacoes {
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
