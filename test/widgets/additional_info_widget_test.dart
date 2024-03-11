// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_flutter/widgets/additional_info.dart';

void main() {
  testWidgets('AdditionalInfoItem displays correct information',
      (WidgetTester tester) async {
    const String weatherIcon = 'lib/assets/icons/umbrella3.png';
    const String label = 'Humidity';
    const int value = 70;

    await tester.pumpWidget(const MaterialApp(
      home: AdditionalInfoItem(
        key: Key('additionalInfoItem'),
        weatherIcon: weatherIcon,
        label: label,
        value: value,
      ),
    ));

    final valueTextFinder =
        find.byKey(const Key('additionalInfoItem_valueText'));
    final labelTextFinder =
        find.byKey(const Key('additionalInfoItem_labelText'));
    final imageFinder = find.byKey(const Key('additionalInfoItem_image'));
    final valueTextWidget = tester.widget<Text>(valueTextFinder);
    final labelTextWidget = tester.widget<Text>(labelTextFinder);
    final imageWidget = tester.widget<Image>(imageFinder);

    expect(valueTextFinder, findsOneWidget);
    expect(labelTextFinder, findsOneWidget);
    expect(imageFinder, findsOneWidget);

    expect(valueTextWidget.style?.fontSize, 16);
    expect(valueTextWidget.style?.color, Colors.white);
    expect(valueTextWidget.style?.fontWeight, FontWeight.bold);

    expect(labelTextWidget.style?.fontSize, 16);
    expect(labelTextWidget.style?.color, Colors.white);

    expect(imageWidget.height, 40);
    expect(imageWidget.image, const AssetImage('lib/assets/icons/umbrella3.png'));
  });
}
