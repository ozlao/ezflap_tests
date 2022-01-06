
import 'package:ezflap_tests/TestWidgets/ZBuild/TestZBuildWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

enum EState {
	notExist,
	offStage,
	onStage,
}

void main() {
	testWidgets("ZBuild tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestZBuildWidget());

		expect(find.text("TestZBuildWidget!"), findsOneWidget);
		expect(find.text("built with make()"), findsOneWidget);
		expect(find.text("built with builder!"), findsOneWidget);
	});
}
