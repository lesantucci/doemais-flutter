import 'package:flutter/material.dart';

class CampanhaScreen extends StatefulWidget {
  const CampanhaScreen({Key? key}) : super(key: key);

  @override
  State<CampanhaScreen> createState() => _CampanhaScreenState();
}

class _CampanhaScreenState extends State<CampanhaScreen> {
  List<Map<String, dynamic>> lista = [
    {

    }
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CardCampanha()
    );
  }
}

class CardCampanha extends StatelessWidget {
const CardCampanha({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10.0),
      child: Card(
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/cat-example.png'),
              radius: 220,
              ),
            ),
            const Text("Text 2")
          ],
        ),
      )
    );
  }
}
