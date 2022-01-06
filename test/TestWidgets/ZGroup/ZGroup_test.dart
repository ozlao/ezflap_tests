
import 'package:ezflap_tests/TestWidgets/ZGroup/TestZGroupWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';

import '../../Utils/TestUtils.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

enum EState {
	notExist,
	offStage,
	onStage,
}

void main() {
	testWidgets("ZGroup tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestZGroupWidget());

		// step = 1
		expect(find.text("TestZGroupWidget!"), findsOneWidget);

		Map<int, EState> map = { 1: EState.notExist, 2: EState.notExist, 3: EState.notExist, 4: EState.notExist, 5: EState.notExist, 6: EState.notExist, 7: EState.notExist };
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 2
		map[1] = EState.onStage;
		map[3] = EState.onStage;
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 3
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 4
		map[2] = EState.onStage;
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 5
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 6
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 7
		map[4] = EState.offStage;
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 8
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 9
		map[4] = EState.onStage;
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 10
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 11
		map[5] = EState.onStage;
		_verifyTexts(map);

		await tester.tapTextButton(); // --> step = 12
		_verifyTexts(map);
		expect(find.text("item1"), findsOneWidget);
		expect(find.text("item2"), findsNothing);
		expect(find.text("item3"), findsOneWidget);

		await tester.tapTextButton(); // --> step = 13
		_verifyTexts(map);
		expect(find.text("item1"), findsOneWidget);
		expect(find.text("item2"), findsNothing);
		expect(find.text("item3"), findsOneWidget);

		await tester.tapTextButton(); // --> step = 14
		map[6] = EState.onStage;
		_verifyTexts(map);
		expect(find.text("item1"), findsOneWidget);
		expect(find.text("item2"), findsNothing);
		expect(find.text("item3"), findsOneWidget);
	});
}

void _verifyTexts(Map<int, EState> mapStates) {
	mapStates.forEach((int idx, EState state) {
		String s = "text ${idx}";
		if (state == EState.notExist) {
			expect(find.text(s, skipOffstage: false), findsNothing);
		}
		else if (state == EState.offStage) {
			expect(find.text(s, skipOffstage: true), findsNothing);
			expect(find.text(s, skipOffstage: false), findsOneWidget);
		}
		else if (state == EState.onStage) {
			expect(find.text(s, skipOffstage: true), findsOneWidget);
		}
	});
}