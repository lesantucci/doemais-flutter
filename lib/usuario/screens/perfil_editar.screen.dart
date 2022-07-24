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
  var txtNome = TextEditingController();
  var txtDtNascimento = TextEditingController();
  var txtContato = TextEditingController();

  var txtSenhaAntiga = TextEditingController();
  var txtNovaSenha = TextEditingController();
  var txtConfirmacaoSenha = TextEditingController();

  final dropdownSexoState = GlobalKey<FormFieldState>();

  String _sexo = 'Feminino';

  final usuarioService = UsuarioService();

  void salvar() {
    final usuario = Usuario();
    usuario.nome = txtNome.text;
    usuario.sexo = _sexo;
    usuario.dtNascimento = txtDtNascimento.text;
    usuario.contato = txtContato.text;

    usuarioService.atualizarPerfil(usuario).then((success) {
      String message = 'Perfil salvo com sucesso!';
      if (!success) {
        message = 'Não foi possível salvar o perfil';
      }
      final snackbar = SnackBar(content: Text(message));

      PerfilController.instance.changeUsuario(usuario);

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  }

  void alterarSenha() {}

  @override
  void didUpdateWidget(covariant PerfilEditarScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      txtNome.text = widget.usuario.nome;
      txtDtNascimento.text = widget.usuario.dtNascimento;
      txtContato.text = widget.usuario.contato;

      if (widget.usuario.sexo != '') {
        dropdownSexoState.currentState?.didChange(widget.usuario.sexo);
      }
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
    return Container(
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
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 24.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(0),
                          ),
                          onPressed: retornar,
                          label: const Text('Editar Perfil'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                CustomTextField(controller: txtNome, label: "Nome"),
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
                            child: CustomTextField(
                                controller: txtDtNascimento,
                                label: "Data de nascimento"),
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
                              onChanged: onChangedSexo,
                              value: _sexo),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextField(controller: txtContato, label: "Contato"),
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
                CustomTextField(
                    controller: txtSenhaAntiga, label: "Senha antiga"),
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
                            child: CustomTextField(
                                controller: txtNovaSenha, label: "Nova senha"),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CustomTextField(
                                controller: txtConfirmacaoSenha,
                                label: "Repetir nova senha"),
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
                              text: 'ALTERAR SENHA', onPressed: alterarSenha))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
