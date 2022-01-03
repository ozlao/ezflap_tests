
import 'package:ezflap_tests/TestWidgets/CustomClasses/TestCustomClassesWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';

void main() {
	testWidgets("Attributes - customClasses - z-if", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestCustomClassesWidget()); // --> 0s
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("state: true"), findsOneWidget);
		expect(find.text("state: false"), findsNothing);
		expect(find.text("rxState: true"), findsOneWidget);
		expect(find.text("rxState: false"), findsNothing);
		expect(find.text("state (show): true", skipOffstage: false), findsOneWidget);
		expect(find.text("state (show): true"), findsNothing);
		expect(find.text("rxState (if and show): true", skipOffstage: false), findsOneWidget);
	});

	testWidgets("Attributes - customClasses - computed", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestCustomClassesWidget()); // --> 1s
		expect(find.text("computed: 42"), findsOneWidget);

		await tester.pumpWithSeconds(1); // --> 1s
		expect(find.text("computed: 0"), findsOneWidget);

		await tester.pumpWithSeconds(1); // --> 1s
		expect(find.text("computed: 1"), findsOneWidget);
	});
}
