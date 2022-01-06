
import 'package:ezflap_tests/TestWidgets/EzEmit/TestEzEmitWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';
import '../../Utils/TestUtils.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzEmit tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzEmitWidget());

		expect(find.text("in TestEzEmitWidget"), findsOneWidget);
		expect(find.text("In Sub! Hello: bye"), findsOneWidget);

		for (int i = 1; i <= 3; i++) {
			await tester.pumpWithSecondsPlusTick(1);
			expect(find.text("one second passed"), findsNWidgets(i));
			expect(find.text("one second passed. someNumber: 88"), findsNWidgets(i));
			expect(find.text("one some seconds passed: ${i + 1}"), findsOneWidget);

			TextButton tb = find.as();
			tb.onPressed!();
			await tester.pumpTick();
			expect(find.text("pressed the button"), findsNWidgets(i));
		}
	});
}
