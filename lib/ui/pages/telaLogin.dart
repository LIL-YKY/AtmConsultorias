import 'package:flutter/material.dart';
import 'package:atm/ui/pages/home.dart';
import 'package:atm/ui/components/my_button.dart';
import 'package:atm/ui/components/my_textfield.dart';
import 'package:atm/ui/components/square_tile.dart';

import 'package:atm/data/controller/validacoes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
// text editing controllers
final usernameController = TextEditingController();
final passwordController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Bem vindo de volta, sentimos sua falta!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Nome de usuário',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Esqueceu a senha?',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: _Entrar,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Ou continue com:',
                          style: TextStyle(),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'lib/ui/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'lib/ui/images/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não é membro?',
                      style: TextStyle(),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Registrar agora',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _Entrar() {
    String nomeUsuarioError = Validacoes.validarNomeUsuario(usernameController.text);
    String senhaError = Validacoes.validarSenha(passwordController.text);

    if (nomeUsuarioError != "correto") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(nomeUsuarioError)),
      );
    } else if (senhaError != "correto") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(senhaError)),
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    }
  }
}
