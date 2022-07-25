import 'package:doemais/commons/models/agenda.model.dart';
import 'package:flutter/material.dart';

class AgendaWidget extends StatefulWidget {
  Agenda agenda;
  AgendaWidget({Key? key, required this.agenda}) : super(key: key);

  @override
  State<AgendaWidget> createState() => _AgendaWidgetState();
}

class _AgendaWidgetState extends State<AgendaWidget> {
  @override
  void initState() {
    super.initState();
    print(widget.agenda.atividade);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff6200ee)),
      ),
      child: SizedBox(
        width: 400,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                  right: BorderSide(width: 1, color: Color(0xff6200ee)),
                )),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.today,
                    color: Color(0xff6200ee),
                    size: 40,
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (widget.agenda.atividade[0] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('SEG',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                    if (widget.agenda.atividade[1] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('TER',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                    if (widget.agenda.atividade[2] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('QUA',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                    if (widget.agenda.atividade[3] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('QUI',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                    if (widget.agenda.atividade[4] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('SEX',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                    if (widget.agenda.atividade[5] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('SAB',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                    if (widget.agenda.atividade[6] == 1)
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('DOM',
                            style: TextStyle(
                                color: Color(0xff6200ee),
                                fontWeight: FontWeight.w700)),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${widget.agenda.horaInicio} - ${widget.agenda.horaFim}',
                    style: const TextStyle(
                        color: Color(0xff6200ee),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
