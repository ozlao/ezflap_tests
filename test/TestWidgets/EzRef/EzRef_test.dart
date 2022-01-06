
import 'package:ezflap_tests/TestWidgets/EzRef/TestEzRefWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzRef tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzRefWidget());

		List<String> arr = [ "key1", "key2", "key3" ];

		expect(find.text("model1: hello world"), findsOneWidget);
		expect(find.text("model2: 42"), findsOneWidget);
		expect(find.text("model3[1]: item2"), findsOneWidget);
		expect(find.text("model4[2]: key3"), findsOneWidget);
		expect(find.text("model5: 88"), findsOneWidget);
		expect(find.text("model: hi hi"), findsOneWidget);
		expect(find.text("ChildSub modelCnt: 888"), findsOneWidget);
		expect(find.text("-Sub modelCnt: 888"), findsOneWidget);
		expect(find.text("Top modelCnt: 888"), findsOneWidget);

		for (int i = 1; i <= 3; i++) {
			expect(find.text("Elapsed seconds: ${i}"), findsOneWidget);
			expect(find.text("Counter: ${i}"), findsOneWidget);
			expect(find.text("Counter in Sub2: ${i}"), findsNWidgets(3));
			expect(find.text("myText: ${arr[i - 1]}!!!"), findsOneWidget);
			expect(find.textContaining("Num refs in map: 3"), findsOneWidget);
			expect(find.textContaining("Ref key1: ${i * 42 + 0}"), findsOneWidget);
			expect(find.textContaining("Ref key2: ${i * 42 + 1}"), findsOneWidget);
			expect(find.textContaining("Ref key3: ${i * 42 + 2}"), findsOneWidget);
			expect(find.text("model2: ${42 + i - 1}"), findsOneWidget);
			expect(find.text("model5: ${88 + i - 1}"), findsOneWidget);
			expect(find.text("ChildSub modelCnt: ${888 + i - 1}"), findsOneWidget);
			expect(find.text("-Sub modelCnt: ${888 + i - 1}"), findsOneWidget);
			expect(find.text("Top modelCnt: ${888 + i - 1}"), findsOneWidget);
			await tester.pumpWithSecondsPlusTick(1);
		}
	});
}
