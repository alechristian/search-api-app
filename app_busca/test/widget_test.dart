// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app_busca/app/pages/home/home_controller.dart';
import 'package:app_busca/app/pages/home/home_page.dart';
import 'package:app_busca/utils/enums/model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_busca/main.dart';

void main() {
  testWidgets('HomePage should render', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify that the AppBar is present
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that text widgtes are present
    expect(find.text("Faça aqui"), findsOneWidget);
    expect(find.text("Escreva aqui."), findsOneWidget);

    //Verify that the TextFiel is present
    expect(find.byType(TextField), findsOneWidget);

    //Verify that the TextButton is present
    expect(find.byType(TextButton), findsOneWidget);
  });

  test('Teste setValidaCampo', () {
    final controller = HomeController();
    //!testando condicao desabilitado
    controller.buscar.text = '12345';
    controller.setValidaCampo('');
    expect(controller.validadeButton, equals(stateButton.desabled));
    //!testando condicao habilitado
    controller.buscar.text = '123456';
    controller.setValidaCampo('');
    expect(controller.validadeButton, equals(stateButton.enabladed));
  });
}
