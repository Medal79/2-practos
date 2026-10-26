import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Добавление, редактирование и удаление заметки',
      (WidgetTester tester) async {
    await tester.pumpWidget(const NotesApp());

    expect(find.text('Заметок пока нет'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Первая заметка');
    await tester.tap(find.text('Сохранить'));
    await tester.pump();
    expect(find.text('Первая заметка'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'Изменённая заметка');
    await tester.tap(find.text('Обновить'));
    await tester.pump();
    expect(find.text('Изменённая заметка'), findsOneWidget);
    expect(find.text('Первая заметка'), findsNothing);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();
    expect(find.text('Заметок пока нет'), findsOneWidget);
  });
}