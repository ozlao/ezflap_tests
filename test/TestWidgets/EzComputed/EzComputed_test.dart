// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ezflap_tests/TestWidgets/EzComputed/TestEzComputedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';

import '../../Utils/TestUtils.dart';

void main() {
	testWidgets("EzComputed tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzComputedWidget());

		for (int i = 0; i < 10; i++) {
			int idx = i + 1;
			int multiply = idx * 10;
			Color color = [ Colors.red, Colors.green, Colors.blue ][idx % 3];

			expect(find.text("Elapsed seconds: ${idx}"), findsOneWidget);
			for (int j = 1; j <= 5; j++) {
				expect(find.text("Multiply ${j}: ${multiply}"), findsOneWidget);
			}
			expect(find.as<Container>().color, color);

			if (multiply % 3 == 1) {
				expect(find.text("vif: ${multiply}"), findsOneWidget);
			}

			await tester.pumpTick();
			expect(find.text("Num Computed invocations: ${i + 1}"), findsOneWidget);

			await tester.pumpWithSeconds(1);
		}
	});

	testWidgets("EzComputed tests - basic", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzComputedWidget()); // --> 1s
		expect(find.text("Multiply 1: 10"), findsOneWidget);
		expect(find.text("Multiply 2: 10"), findsOneWidget);
		expect(find.text("Multiply 3: 10"), findsOneWidget);
		expect(find.text("Multiply 4: 10"), findsOneWidget);
		expect(find.text("Multiply 5: 10"), findsOneWidget);
		expect(find.text("Num Computed invocations: 1"), findsOneWidget);
		expect(find.as<Container>().color, Colors.green);
		expect(find.text("vif: 10"), findsOneWidget);

		await tester.pumpWithSeconds(1); // --> 2s
		expect(find.text("Multiply 1: 20"), findsOneWidget);
		expect(find.text("Multiply 2: 20"), findsOneWidget);
		expect(find.text("Num Computed invocations: 2"), findsOneWidget);
		expect(find.as<Container>().color, Colors.blue);
		expect(find.text("vif: 20"), findsNothing);


		await tester.pumpWithSeconds(1); // --> 3s
		expect(find.text("Multiply 1: 30"), findsOneWidget);
		expect(find.text("Multiply 2: 30"), findsOneWidget);
		expect(find.text("Num Computed invocations: 3"), findsOneWidget);
		expect(find.as<Container>().color, Colors.red);
		expect(find.text("vif: 30"), findsNothing);

		await tester.pumpWithSeconds(1); // --> 4s
		expect(find.text("vif: 40"), findsOneWidget);
	});
}
