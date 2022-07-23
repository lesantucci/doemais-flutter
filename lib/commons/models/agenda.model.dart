class Agenda {
  final List<int> agenda;
  final String horaInicio;
  final String horaFim;

  const Agenda(
      {required this.agenda,
      required this.horaInicio,
      required this.horaFim});

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
        agenda: json['agenda'],
        horaInicio: json['horaInicio'],
        horaFim: json['horaFim']);
  }
}