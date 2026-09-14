/// Persona 1 — Alejandro Javier Cruz Linares — modelo de un registro de asistencia.
///
/// Los datos viven fuera de la capa visual. Esta clase no construye widgets.
class Estudiante {
  const Estudiante({
    required this.nombre,
    required this.carne,
    required this.presente,
  });

  final String nombre;
  final String carne;
  final bool presente;

  Estudiante copyWith({
    String? nombre,
    String? carne,
    bool? presente,
  }) {
    return Estudiante(
      nombre: nombre ?? this.nombre,
      carne: carne ?? this.carne,
      presente: presente ?? this.presente,
    );
  }
}
