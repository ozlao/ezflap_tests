
import 'package:ezflap_tests/TestWidgets/Lifecycle/OnlyPrimary/TestLifecycleOnlyPrimaryWidget.dart';
import 'package:ezflap_tests/TestWidgets/Lifecycle/WithInitialWidget/TestLifecycleWithInitialWidgetWidget.dart';
import 'package:ezflap_tests/TestWidgets/Lifecycle/WithInitialZml/TestLifecycleWithInitialZmlWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("Lifecycle - OnlyPrimary", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestLifecycleOnlyPrimaryWidget(), false);
		expect(find.text("state: initialized"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("state: ready"), findsOneWidget);
	});

	testWidgets("Lifecycle - WithInitialWidget", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestLifecycleWithInitialWidgetWidget(), false);
		expect(find.text("state: initialized"), findsNothing);
		expect(find.text("state: ready"), findsNothing);
		expect(find.text("from initial widget"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("state: initialized"), findsNothing);
		expect(find.text("from initial widget"), findsNothing);
		expect(find.text("state: ready"), findsOneWidget);
	});

	testWidgets("Lifecycle - WithInitialZml", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestLifecycleWithInitialZmlWidget(), false);
		expect(find.text("from initial zml. state: initialized"), findsOneWidget);
		expect(find.text("state: prepared"), findsNothing);
		expect(find.text("state: ready"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("from initial zml. state: initialized"), findsNothing);
		expect(find.text("from initial zml. state: preparing"), findsOneWidget);
		expect(find.text("state: ready"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("from initial zml. state: initialized"), findsNothing);
		expect(find.text("from initial zml. state: preparing"), findsNothing);
		expect(find.text("state: ready"), findsOneWidget);
	});
}
