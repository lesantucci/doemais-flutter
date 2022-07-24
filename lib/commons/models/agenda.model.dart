class Agenda {
  final List<dynamic> atividade;
  final String horaInicio;
  final String horaFim;

  const Agenda(
      {required this.atividade,
      required this.horaInicio,
      required this.horaFim});

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
        atividade: json['atividade'],
        horaInicio: json['horaInicio'],
        horaFim: json['horaFim']);
  }
}