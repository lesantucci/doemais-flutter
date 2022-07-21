import 'package:flutter/material.dart';

class DetalhesScreen extends StatelessWidget {
  const DetalhesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detalhes da Campanha',
      home: buildHomePage('Detalhes da Campanha'),
    );
  }

  Widget buildHomePage(String title) {
    const titleText = Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'Doação de Rações',
        style:
            TextStyle(fontSize: 20, color: Color.fromARGB(255, 211, 31, 235)),
      ),
    );

    const subTitle = Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Abertura de nova campanha para doações para instituições e abrigos de animais '
          'que necessitam de seu apoio, atualmente são 1200 cachorros e 200 gatos em, '
          'aguardando um lar que precisam de seu apoio para continuarem mantendo suas '
          'energias ao aguardo de seu futuro dono. Ajude-nos com um saco de 1 a 10 kg,'
          ' de preferência rações sem muitos aditivos. ',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
          ),
        ));

    final texto = Container(
      child: Column(
        children: [titleText, subTitle],
      ),
    );

    final imagem1 = Image.network(
      'https://picsum.photos/250?image=9',
      width: 125,
      height: 125,
    );

    final imagem2 = Image.network(
      'https://picsum.photos/250?image=9',
      width: 125,
      height: 125,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [texto, imagem1, imagem2],
            ),
          ),
        ),
      ),
    );
  }
}

// children: [
//           Text(
//             'Doação de Rações',
//             style:
//                 TextStyle(color: AppColor.primary, fontSize: 18, height: 1.5),
//           ),
//           Text(
//             'Exemplo de Texto...',
//             style: TextStyle(fontSize: 18, height: 1.5),
//           ),
//           Container(
//             child: Image.network(
//               'https://picsum.photos/250?image=9',
//               width: 125,
//               height: 125,
//             ),
//           ),
//           Container(
//             child: Image.network(
//               'https://picsum.photos/250?image=9',
//               width: 125,
//               height: 125,
//             ),
//           ),
//           Container(
//             child: Image.network(
//               'https://picsum.photos/250?image=9',
//               width: 125,
//               height: 125,
//             ),
//           )
//         ],