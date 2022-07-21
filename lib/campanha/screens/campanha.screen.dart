import 'package:flutter/material.dart';

class CampanhaScreen extends StatefulWidget {
  const CampanhaScreen({Key? key}) : super(key: key);

  @override
  State<CampanhaScreen> createState() => _CampanhaScreenState();
}

class _CampanhaScreenState extends State<CampanhaScreen> {
  List<Map<String, dynamic>> lista = [{}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        height: 120,
        margin: EdgeInsets.all(10.0),
        child: CardCampanha()
      )
    );
  }
}

class CardCampanha extends StatelessWidget {
  const CardCampanha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('lib/assets/images/cat-example.png'),
                  radius: 220,
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "Nome",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text("Instituição"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Descricao"),
                  ),
                  Row(
                    children: [
                      const Expanded(flex: 2, child: Text("Localidade")),
                      Expanded(
                          flex: 0,
                          child: Padding(
                              padding: EdgeInsetsDirectional.only(end: 10),
                              child: SizedBox(
                                height: 40,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.favorite,
                                    size: 24.0,
                                  ),
                                  onPressed: () => {},
                                  label: const Text('Apoiar'),
                                ),
                              )
                            )
                          )
                      ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
