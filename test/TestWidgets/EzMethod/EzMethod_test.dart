
import 'package:ezflap_tests/TestWidgets/EzMethod/TestEzMethodWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../Utils/TestUtils.dart';

import 'package:ezflap/ezflap.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzMethod tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzMethodWidget());

		for (int i = 0; i < 10; i++) {
			int idx = i + 1;
			int multiply = idx * 10;
			Color color = [ Colors.red, Colors.green, Colors.blue ][idx % 3];

			expect(find.text("Elapsed seconds: ${idx}"), findsOneWidget);
			expect(find.text("Multiply: ${multiply}"), findsOneWidget);
			expect(find.as<Container>().color, color);
			await tester.pumpWithSeconds(1);
		}
	});
}
