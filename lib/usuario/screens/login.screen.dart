import 'package:doemais/home/screens/home.screen.dart';
import 'package:doemais/usuario/screens/cadastro.screen.dart';
import 'package:doemais/usuario/services/usuario.service.dart';
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
  bool _isDisabled = false;

  void signIn() async {
    setState(() {
      _isDisabled = true;
    });
    final usuarioService = UsuarioService();
    usuarioService.login(_login, _password).then((value) => {
          if (value)
            {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              )
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Falha ao realizar login'))),
              setState(() {
                _isDisabled = false;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "DOE  ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              Icon(
                Icons.add,
                color: Colors.red,
                size: 46,
              ),
              Text("  MAIS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36))
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FractionallySizedBox(
              widthFactor: 0.80,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    _login = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Usu??rio',
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
          Flexible(
              child: FractionallySizedBox(
                  widthFactor: 0.80,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 24.0,
                      ),
                      onPressed: habilitaBotao(),
                      label: const Text('Acessar'),
                    ),
                  ))),
          const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("Ainda n??o sou cadastrado, gostaria de")),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CadastroScreen()),
                );
              },
              child: const Text("Cadastrar"))
        ],
      ),
    ));
  }

  habilitaBotao() {
    return _isDisabled ? null : () => {signIn()};
  }
}
