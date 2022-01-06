
import 'package:ezflap_tests/TestWidgets/EzReactive/TestEzReactiveWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';

import '../../Utils/TestUtils.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzReactive tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzReactiveWidget());

		expect(find.text("TestEzReactiveWidget!"), findsOneWidget);
		expect(find.text("entity1.hello1: 88"), findsOneWidget);
		expect(find.text("entity1.hello2: shijie"), findsOneWidget);
		expect(find.text("In Sub"), findsOneWidget);
		expect(find.text("sub.isEntity2Initialized: false"), findsOneWidget);
		expect(find.text("isEntity2Initialized: false"), findsOneWidget);
		expect(find.text("text: cur value: 42"), findsNothing);
		expect(find.text("text: cur value: 43"), findsNothing);
		expect(find.text("entity2.hello1: 42"), findsNothing);
		expect(find.text("entity2.hello1: 43"), findsNothing);
		expect(find.text("entity2.hello2: cur value: 42"), findsNothing);
		expect(find.text("entity2.hello2: cur value: 43"), findsNothing);
		expect(find.text("entity1.other.wow: 888"), findsOneWidget);
		expect(find.text("entity1.arrAnimals[1]: cat"), findsOneWidget);
		expect(find.text("arrLocalAnimals[1]: lizard"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.text("sub.isEntity2Initialized: true"), findsOneWidget);
		expect(find.text("isEntity2Initialized: true"), findsOneWidget);
		expect(find.text("text: cur value: 43"), findsOneWidget);
		expect(find.textContaining("entity2.hello1: 43"), findsOneWidget);
		expect(find.textContaining("entity2.hello2: cur value: 43"), findsOneWidget);
		expect(find.text("entity1.other.wow: 889"), findsOneWidget);
		expect(find.text("entity1.arrAnimals[1]: kato"), findsOneWidget);
		expect(find.text("arrLocalAnimals[1]: lizardo"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.text("text: cur value: 44"), findsOneWidget);
		expect(find.textContaining("entity2.hello1: 44"), findsOneWidget);
		expect(find.textContaining("entity2.hello2: cur value: 44"), findsOneWidget);
		expect(find.text("entity1.other.wow: 890"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.text("text: cur value: 45"), findsOneWidget);
		expect(find.textContaining("entity2.hello1: 45"), findsOneWidget);
		expect(find.textContaining("entity2.hello2: cur value: 45"), findsOneWidget);
		expect(find.text("entity1.other.wow: 891"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("entity1.hello1: 89"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("entity1.hello1: 90"), findsOneWidget);
	});
}
