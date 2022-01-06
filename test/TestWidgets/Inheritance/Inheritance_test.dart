
import 'package:ezflap_tests/TestWidgets/Inheritance/TestInheritanceWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("Inheritance", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestInheritanceWidget());
		expect(find.textContaining("In HigherParent"), findsOneWidget);
		expect(find.textContaining("In Parent"), findsOneWidget);
		expect(find.textContaining("In TestInheritanceWidget"), findsOneWidget);
	});
}
