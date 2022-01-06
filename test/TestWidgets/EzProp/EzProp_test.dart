
import 'package:ezflap_tests/TestWidgets/EzProp/TestEzPropWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzProp tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzPropWidget());

		for (int i = 1; i <= 3; i++) {
			expect(find.text("Elapsed seconds: ${i}"), findsOneWidget);
			expect(find.text("Hello: bye"), findsOneWidget);
			expect(find.text("Nihao: shijie"), findsOneWidget);
			expect(find.text("Counter: ${i}"), findsOneWidget);
			await tester.pumpWithSecondsPlusTick(1);
		}
	});
}
