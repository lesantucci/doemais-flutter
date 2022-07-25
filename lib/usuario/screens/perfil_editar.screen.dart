import 'package:doemais/commons/widgets/custom_button.dart';
import 'package:doemais/commons/widgets/custom_dropdown.dart';
import 'package:doemais/commons/widgets/text_field.dart';
import 'package:doemais/commons/widgets/title.dart';
import 'package:doemais/usuario/controller/perfil_controller.dart';
import 'package:doemais/usuario/models/usuario.model.dart';
import 'package:doemais/usuario/services/usuario.service.dart';
import 'package:flutter/material.dart';

final List<String> listaSexo = ['Feminino', 'Masculino'];

class PerfilEditarScreen extends StatefulWidget {
  final Usuario usuario;

  const PerfilEditarScreen(this.usuario, {super.key});

  @override
  State<PerfilEditarScreen> createState() => _PerfilEditarScreenState();
}

class _PerfilEditarScreenState extends State<PerfilEditarScreen> {
  final dropdownSexoState = GlobalKey<FormFieldState>();
  String _nome = "";
  String _dtNascimento = "";
  String _sexo = "";
  String _contato = "";

  final usuarioService = UsuarioService();

  void salvar() {
    final usuario = Usuario();
    usuario.nome = _nome == "" ? widget.usuario.nome : _nome;
    usuario.sexo =  _sexo == "" ? widget.usuario.sexo : _sexo;
    usuario.dtNascimento =  _dtNascimento == "" ? widget.usuario.dtNascimento : _dtNascimento;
    usuario.contato =  _contato == "" ? widget.usuario.contato : _contato;

    usuarioService.atualizarPerfil(usuario).then((success) {
      String message = 'Perfil salvo com sucesso!';
      if (!success) {
        message = 'Não foi possível salvar o perfil';
      }
      final snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  }

  void onChangedSexo(String? value) {
    setState(() {
      _sexo = value ?? "";
    });
  }

  void retornar() {
    PerfilController.instance.changePage(PerfilController.perfilDetalheScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          child: CustomTitle(texto: "Dados pessoais"),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    initialValue: widget.usuario.nome,
                    onChanged: (text) {
                      setState(() {
                        _nome = text;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  )
                  ,
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: TextFormField(
                                initialValue: widget.usuario.dtNascimento,
                                onChanged: (text) {
                                  setState(() {
                                    _dtNascimento = text;
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Data Nascimento',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CustomDropdown(
                                label: "Sexo",
                                state: dropdownSexoState,
                                lista: listaSexo,
                                onChanged: (value) => {
                                  setState(() => {
                                    _sexo = value
                                  })
                                },
                                value: widget.usuario.sexo),
                          ),
                        ),
                      ],
                    ),
                  ),
                 TextFormField(
                    initialValue: widget.usuario.contato,
                    onChanged: (text) {
                      setState(() {
                        _contato = text;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Contato',
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 180,
                            child: CustomButton(
                                text: 'SALVAR ALTERAÇÕES', onPressed: salvar))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, top: 60),
                          child: CustomTitle(texto: "Conta"),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (text) {},
                    decoration: const InputDecoration(
                      labelText: 'Senha Antiga',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child:  TextFormField(
                                obscureText: true,
                                onChanged: (text) {},
                                decoration: const InputDecoration(
                                  labelText: 'Nova Senha',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child:  TextFormField(
                                obscureText: true,
                                onChanged: (text) {},
                                decoration: const InputDecoration(
                                  labelText: 'Repetir Nova Senha',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 180,
                            child: CustomButton(
                                text: 'ALTERAR SENHA', onPressed: () => {

                                }))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
