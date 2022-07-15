import 'package:doemais/home/screens/home-page.screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  final String title = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _login = '';
  String _password = '';

  void signIn() async {
    // final usuarioService = UsuarioService();
    // usuarioService.realizarLogin(_login, _password).then((value) => {
    //   if(value) {
    //     Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const ProdutosPage()),
    //   )} 
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
              widthFactor: 0.80,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    _login = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Usuário',
                ),
              ),
            ),
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.80,
                child:TextFormField(
                  obscureText: true,
                  onChanged: (text) {
                    setState(() {
                      _password = text;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                )
              )
             ),
             Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.80,
                heightFactor: 0.070,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    size: 24.0,
                  ),
                  onPressed: () => {
                  },
                    label: const Text('Logar'),
                  ),
              ))
          ],
        ),
      ),
      )
      
    );
  }
}