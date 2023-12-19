class Restriccion {
  final String alimento;
  final String restriccionPor;
  bool isSelected;

  Restriccion(
      {required this.alimento,
      required this.restriccionPor,
      this.isSelected = false});
}
