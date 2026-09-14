import 'package:flutter/material.dart';

import '../models/estudiantes_iniciales.dart';
import '../models/estudiante.dart';
import '../widgets/fila_asistencia.dart';

/// Persona 4 — Juleysi Nicolle Carballo — único [StatefulWidget] de la pantalla.
///
/// Todo cambio de asistencia pasa por [setState] aquí.
/// Las filas no guardan estado propio.
class PantallaAsistencia extends StatefulWidget {
  const PantallaAsistencia({super.key});

  @override
  State<PantallaAsistencia> createState() => _PantallaAsistenciaState();
}

class _PantallaAsistenciaState extends State<PantallaAsistencia> {
  late List<Estudiante> _estudiantes;

  @override
  void initState() {
    super.initState();
    _estudiantes = List<Estudiante>.of(estudiantesIniciales);
  }

  int get _presentes =>
      _estudiantes.where((estudiante) => estudiante.presente).length;

  void _cambiarPresente(int indice, bool presente) {
    setState(() {
      _estudiantes = [
        for (var i = 0; i < _estudiantes.length; i++)
          if (i == indice)
            _estudiantes[i].copyWith(presente: presente)
          else
            _estudiantes[i],
      ];
    });
  }

  void _marcarTodosPresentes() {
    setState(() {
      _estudiantes = [
        for (final estudiante in _estudiantes)
          estudiante.copyWith(presente: true),
      ];
    });
  }

  void _restablecer() {
    setState(() {
      _estudiantes = List<Estudiante>.of(estudiantesIniciales);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingeniebros',
                    style: tema.textTheme.headlineSmall,
                  ),
                  Text(
                    'Presentes $_presentes / ${_estudiantes.length}',
                    style: tema.textTheme.titleMedium?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: _marcarTodosPresentes,
                      child: const Text(
                        'Todos presente',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _restablecer,
                      child: const Text(
                        'Restablecer',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _estudiantes.length,
                itemBuilder: (context, indice) {
                  final estudiante = _estudiantes[indice];
                  return FilaAsistencia(
                    key: ValueKey<String>(estudiante.carne),
                    nombre: estudiante.nombre,
                    carne: estudiante.carne,
                    presente: estudiante.presente,
                    onCambioPresente: (presente) {
                      _cambiarPresente(indice, presente);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
