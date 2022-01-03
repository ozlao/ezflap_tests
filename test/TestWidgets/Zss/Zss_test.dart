
import 'package:ezflap_tests/TestWidgets/Zss/TestZssWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';

void main() {
	testWidgets("ZSS tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestZssWidget());

		expect(find.text("fixed text"), findsOneWidget);
		expect(find.text("local zss"), findsOneWidget);
		expect(find.text("external zss"), findsOneWidget);
		expect(find.text("external zss 1"), findsOneWidget);
		expect(find.text("external zss 2"), findsOneWidget);
		expect(find.text("external zss 3"), findsOneWidget);

		expect(find.text("an internal 1"), findsOneWidget);
		expect(find.text("an internal 2"), findsOneWidget);
		expect(find.text("global"), findsOneWidget);

		expect(find.text("extOverByLocal local"), findsOneWidget);
		expect(find.text("ext1OverByLocal local"), findsOneWidget);
		expect(find.text("ext1OverByExt ext"), findsOneWidget);
		expect(find.text("ext2OverByLocal local"), findsOneWidget);
		expect(find.text("ext2OverByExt ext"), findsOneWidget);
		expect(find.text("ext2OverByExt1 ext1"), findsOneWidget);
		expect(find.text("ext3OverByLocal local"), findsOneWidget);
		expect(find.text("ext3OverByExt ext"), findsOneWidget);
		expect(find.text("ext3OverByExt1 ext1"), findsOneWidget);
		expect(find.text("ext3OverByExt2 ext2"), findsOneWidget);

		expect(find.text("found red color"), findsOneWidget);

		expect(find.text("show by class"), findsNothing);
		expect(find.text("show by attr"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("show by class"), findsOneWidget);
		expect(find.text("show by attr"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("show by class"), findsNothing);
		expect(find.text("show by attr"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("show by class"), findsOneWidget);
		expect(find.text("show by attr"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("show by class"), findsNothing);
		expect(find.text("show by attr"), findsNothing);
	});
}
