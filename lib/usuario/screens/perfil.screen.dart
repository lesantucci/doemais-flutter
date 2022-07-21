import 'package:doemais/usuario/models/usuario.model.dart';
import 'package:doemais/usuario/services/usuario.service.dart';
import 'package:flutter/material.dart';

final List<String> listaSexo = ['Feminino', 'Masculino'];

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  var txtNome = TextEditingController();
  var txtDtNascimento = TextEditingController();
  var txtEmail = TextEditingController();
  var txtContato = TextEditingController();

  final dropdownSexoState = GlobalKey<FormFieldState>();

  String _sexo = 'Feminino';

  final usuarioService = UsuarioService();

  void carregarPerfil() async {
    usuarioService.consultarPerfil().then((usuario) {
      setState(() {
        txtNome.text = usuario.nome;
        txtDtNascimento.text = usuario.dtNascimento;
        txtEmail.text = usuario.email;
        txtContato.text = usuario.contato;

        if (usuario.sexo != '') {
          dropdownSexoState.currentState?.didChange(usuario.sexo);
        }
      });
    });
  }

  void salvar() {
    final usuario = Usuario(
        nome: txtNome.text,
        sexo: _sexo,
        email: txtEmail.text,
        dtNascimento: txtDtNascimento.text,
        contato: txtContato.text);

    usuarioService.atualizarPerfil(usuario).then((success) {
      String message = 'Perfil salvo com sucesso!';
      if (!success) {
        message = 'Não foi possível salvar o perfil';
      }
      final snackbar = SnackBar(content: Text(message));

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  }

  @override
  void initState() {
    super.initState();

    carregarPerfil();
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
                  controller: txtNome,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.80,
                child: TextFormField(
                  controller: txtDtNascimento,
                  decoration:
                      const InputDecoration(labelText: 'Data nascimento'),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.80,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  elevation: 16,
                  key: dropdownSexoState,
                  items: listaSexo.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _sexo = value!;
                    });
                  },
                  value: _sexo,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.80,
                child: TextFormField(
                  controller: txtEmail,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FractionallySizedBox(
                widthFactor: 0.80,
                child: TextFormField(
                  controller: txtContato,
                  decoration: const InputDecoration(
                    labelText: 'Contato',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.80,
              child: ElevatedButton(
                onPressed: () {
                  salvar();
                },
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
