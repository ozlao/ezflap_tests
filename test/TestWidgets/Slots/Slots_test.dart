
import 'package:ezflap_tests/TestWidgets/Slots/TestSlotsHostWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("Slots tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestSlotsHostWidget());

		expect(find.text("host widget"), findsOneWidget);
		expect(find.text("hosted widget"), findsOneWidget);
		expect(find.text("provider: anonymous"), findsOneWidget);
		expect(find.text("provider: two"), findsOneWidget);
		expect(find.text("provider: one"), findsOneWidget);
		expect(find.text("provider2 default"), findsNothing);
		expect(find.text("unusedWithDefault"), findsOneWidget);

		expect(find.text("single child not in list"), findsOneWidget);
		expect(find.text("default for single child not in list 1"), findsNothing);
		expect(find.text("default for single child not in list 2"), findsOneWidget);
		expect(find.text("single child not in list without default"), findsOneWidget);

		expect(find.text("default for single child in list 1"), findsNothing);
		expect(find.text("single child in list"), findsOneWidget);

		expect(find.text("default for multi child in list (1)"), findsNothing);
		expect(find.text("default for multi child in list (2)"), findsNothing);
		expect(find.text("default for multi child in list (3)"), findsNothing);
		expect(find.text("multi child in list (1)"), findsOneWidget);
		expect(find.text("multi child in list (2)"), findsOneWidget);
		expect(find.text("multi child in list (3)"), findsOneWidget);
		expect(find.text("multi child in list without default (1)"), findsOneWidget);
		expect(find.text("multi child in list without default (2)"), findsOneWidget);
		expect(find.text("multi child in list without default (3)"), findsOneWidget);
		expect(find.text("default for multi child not in list (1)"), findsOneWidget);
		expect(find.text("default for multi child not in list (2)"), findsOneWidget);
		expect(find.text("default for multi child not in list (3)"), findsOneWidget);

		expect(find.textContaining("withScope 1: hello world"), findsOneWidget);
		expect(find.text("withScope 2: nihao shijie"), findsOneWidget);
	});
}
