import 'package:doemais/usuario/screens/login.screen.dart';
import 'package:doemais/usuario/services/usuario.service.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  final String title = 'Login';

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  String _email = '';
  String _password = '';
  String _confirmacaoPassword = '';
  bool _isDisabled = false;

  void cadastrar() async {
    if (validatePassword()) {
      final usuarioService = UsuarioService();
      setState(() {_isDisabled = true;});
      usuarioService.cadastrar(_email, _password).then((value) => {
            if (value) {
              Navigator.pop(context)
              // Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const LoginScreen()),
              //     )
            } else {
              setState(() {_isDisabled = false;})
            }
          });
    } 
  }

  bool validatePassword() {
    return _password == _confirmacaoPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FractionallySizedBox(
              widthFactor: 0.80,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                  widthFactor: 0.80,
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (text) {
                      setState(() {
                        _password = text;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                  widthFactor: 0.80,
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (text) {
                      setState(() {
                        _confirmacaoPassword = text;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Repetir Senha',
                    ),
                  ))),
          Flexible(
              child: FractionallySizedBox(
            widthFactor: 0.80,
            child:  SizedBox(
                    height: 50,
                    child: ElevatedButton(
              onPressed: _isDisabled ? null : () => {cadastrar()},
              child: const Text('Cadastrar'),
            ),
          ))),
          const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("J?? sou cadastrado, gostaria de me")),
          TextButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text("Acessar o Sistema"))
        ],
      ),
    ));
  }
}
