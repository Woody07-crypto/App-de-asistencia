import 'package:flutter/material.dart';

/// Persona 3 — Ivan Alessandro Vazquez Martinez — fila extraída como clase independiente.
///
/// Recibe nombre, carné y presente por el constructor.
/// No lee el estado de [PantallaAsistencia]; avisa el cambio con [onCambioPresente].
class FilaAsistencia extends StatelessWidget {
  const FilaAsistencia({
    super.key,
    required this.nombre,
    required this.carne,
    required this.presente,
    required this.onCambioPresente,
  });

  final String nombre;
  final String carne;
  final bool presente;
  final ValueChanged<bool> onCambioPresente;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tema.textTheme.bodyLarge,
                ),
                Text(
                  carne,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tema.textTheme.bodySmall?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            presente ? 'Presente' : 'Ausente',
            style: tema.textTheme.labelMedium,
          ),
          Checkbox(
            value: presente,
            onChanged: (valor) {
              if (valor != null) {
                onCambioPresente(valor);
              }
            },
          ),
        ],
      ),
    );
  }
}
