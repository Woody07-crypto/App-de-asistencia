import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_asistencia/main.dart';

void main() {
  testWidgets(
    'La aplicación de asistencia inicia correctamente',
    (WidgetTester tester) async {
      await tester.pumpWidget(const AppAsistencia());
      await tester.pumpAndSettle();

      expect(find.byType(MaterialApp), findsOneWidget);
    },
  );
}