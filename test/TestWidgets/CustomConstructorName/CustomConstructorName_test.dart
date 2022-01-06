
import 'package:ezflap_tests/TestWidgets/CustomConstructorName/TestCustomConstructorNameWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("Custom constructor name tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestCustomConstructorNameWidget());

		expect(find.text("hello world"), findsOneWidget);
	});
}
