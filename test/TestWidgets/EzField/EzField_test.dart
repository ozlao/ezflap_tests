
import 'package:ezflap_tests/TestWidgets/EzField/TestEzFieldWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzField tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzFieldWidget());

		expect(find.text("late int: 42"), findsOneWidget);
		expect(find.text("late double: 42.42"), findsOneWidget);
		expect(find.text("late bool: false"), findsOneWidget);
		expect(find.text("late String: late string"), findsOneWidget);
		expect(find.text("null int: null"), findsOneWidget);
		expect(find.text("null double: null"), findsOneWidget);
		expect(find.text("null bool: null"), findsOneWidget);
		expect(find.text("null String: null"), findsOneWidget);
		expect(find.text("nonNull int: 69"), findsOneWidget);
		expect(find.text("nonNull double: 69.69"), findsOneWidget);
		expect(find.text("nonNull bool: true"), findsOneWidget);
		expect(find.text("nonNull String: non-null string"), findsOneWidget);
		expect(find.text("default int: 88"), findsOneWidget);
		expect(find.text("default double: 88.88"), findsOneWidget);
		expect(find.text("default bool: true"), findsOneWidget);
		expect(find.text("default String: a default string"), findsOneWidget);
		expect(find.text("custom-named int: 9"), findsOneWidget);
		expect(find.text("custom-named double: 9.9"), findsOneWidget);
		expect(find.text("custom-named bool: false"), findsOneWidget);
		expect(find.text("custom-named String: custom string"), findsOneWidget);

		expect(find.textContaining("myClassVar:"), findsOneWidget);
		expect(find.textContaining("myClassVar: tutulu"), findsNothing);
		expect(find.text("myClassVar: 42"), findsOneWidget);

		expect(find.text("Elapsed seconds: 1"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("Elapsed seconds: 2"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("Elapsed seconds: 3"), findsOneWidget);

		await tester.pumpWithSeconds(60);
		expect(find.text("Elapsed seconds: 63"), findsOneWidget);
	});
}
