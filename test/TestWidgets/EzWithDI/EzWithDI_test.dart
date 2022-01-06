
import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/EzWithDI/Fruit/Cherry/CherryFruitProvider.dart';
import 'package:ezflap_tests/TestWidgets/EzWithDI/Fruit/FruitResolver.dart';
import 'package:ezflap_tests/TestWidgets/EzWithDI/Fruit/Tomato/TomatoFruitProvider.dart';
import 'package:ezflap_tests/TestWidgets/EzWithDI/SvcOverriddenTest/SvcOverriddenTest_.dart';
import 'package:ezflap_tests/TestWidgets/EzWithDI/TestEzWithDIWidget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

class SvcOverriddenTest_Override extends SvcOverriddenTest {
	int getTestValue() {
		return 2020;
	}
}

void main() {
	testWidgets("EzWithDI tests", (WidgetTester tester) async {
		FruitResolver.i().setProvider(TomatoFruitProvider.i());

		WidgetWrapper ww =
			WidgetWrapper(TestEzWithDIWidget(),
				mapDIOverrides: {
					"SvcOverriddenTest": SvcOverriddenTest_Override(),
				}
			)
		;
		await tester.pumpWidgetIntoScaffold(ww.widget);

		expect(find.text("testValue: 1717"), findsOneWidget);
		expect(find.text("subTestValue: 1818"), findsOneWidget);
		expect(find.text("overriddenTestValue: 2020"), findsOneWidget);

		expect(find.text("fruit name: Tomato"), findsOneWidget);
		expect(find.text("fruit name: Cherry"), findsNothing);

		FruitResolver.i().setProvider(CherryFruitProvider.i());

		await tester.pumpWithSeconds(1);
		expect(find.text("fruit name: Tomato"), findsNothing);
		expect(find.text("fruit name: Cherry"), findsOneWidget);
	});
}
