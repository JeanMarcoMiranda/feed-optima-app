class RequerimientosVacas {
  final String pesoVivo;
  final String eMetab;
  final String vitA;
  final String vitD;
  final String ca;
  final String p;
  final String fibra;

  RequerimientosVacas(
      {required this.pesoVivo,
      required this.eMetab,
      required this.vitA,
      required this.vitD,
      required this.ca,
      required this.p,
      required this.fibra});
}

class RequerimientosToros extends RequerimientosVacas {
  final String proteina;
  final String ms;
  final int n;
  final String raza;

  RequerimientosToros(
      {required this.proteina,
      required this.ms,
      required this.n,
      required this.raza,
      required super.pesoVivo,
      required super.eMetab,
      required super.vitA,
      required super.vitD,
      required super.ca,
      required super.p,
      required super.fibra});
}
