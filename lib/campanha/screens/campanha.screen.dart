import 'package:doemais/theme/app-color.dart';
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
      appBar: AppBar(
        title: const Text("Campanhas"),
      ),
      body:
          Container (
            margin: const EdgeInsets.all(10.0),
            child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child:
              TextFormField(
                onChanged: (text) {
                },
                decoration: const InputDecoration(
                  labelText: 'Pesquisa',
                ),
              ),
          ),
          const CardCampanha()])
          )
      
      
    );
  }
}

class CardCampanha extends StatelessWidget {
  const CardCampanha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 140,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.all(5),
              child: SizedBox(
                height: 100,
                width: 100,
                child: 
                CircleAvatar(
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: Color(0xff6200ee)
                      ),
                      "CAMPANHA XYZ",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      style: TextStyle(
                        fontSize: 12
                      ),
                      "Instituição"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      textScaleFactor: 1.0,
                      text: const TextSpan(text: "Lorem Forem lur Lorem Forem lur ed Lorem Forem lur ed Lorem Forem lur ed Lorem Forem lur ed Lorem Forem lur ed")
                      )
                  ),
                  Spacer(),
                  Row(
                    children: [
                      const Expanded(flex: 2, child: Text("Localidade")),
                      Expanded(
                          flex: 0,
                          child: SizedBox(
                                height: 32,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.favorite,
                                    size: 18.0,
                                  ),
                                  onPressed: () => {},
                                  label: const Text('Apoiar'),
                                ),
                              )
                          )
                      ],
                  )
                ],
              )
            )
        ],
      )
        )
      )
    );
  }
}
