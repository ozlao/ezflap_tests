
import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/WidgetWrapper/Sub/Sub.dart';
import 'package:ezflap_tests/TestWidgets/WidgetWrapper/TestWidgetWrapperWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

class SubState extends MockWidgetStateBase implements ISubState {
	int getLuckyNumber() {
		return 8888;
	}
}

void main() {
	testWidgets("WidgetWrapper tests", (WidgetTester tester) async {
		WidgetWrapper ww =
			WidgetWrapper(TestWidgetWrapperWidget(),
				mapProps: {
					"hello": "world",
					"answer": 42,
				},
				mapRouteParams: {
					"routeValue": 88,
				},
				mapHostedWidgetMockFactories: {
					"Sub": WidgetMockFactory(
						funcWidgetFactory: () => Container(),
						funcCreateMockWidgetState: () => SubState(),
					),
				},
			)
			..initModel<String>(name: "lateModel", value: "dummy")
			..initModel<String?>(name: "nullableModel", value: "from outside: nullableModel")
			..initModel<String?>(name: "optionalModel2", value: "from outside: optionalModel2")
			..initModel<int>(name: "counterModel", value: 0)
		;
		await tester.pumpWidgetIntoScaffold(ww.widget);


		// test props
		expect(find.text("hello: world"), findsOneWidget);
		expect(find.text("answer: 42"), findsOneWidget);


		// test route params
		expect(find.text("routeValue: 88"), findsOneWidget);


		// test mocks
		WidgetMock? wm = ww.tryGetSingleWidgetMock("Sub");
		expect(wm != null, true);
		expect(wm!.isPropPopulated("hello"), true);
		expect(wm.getPropValue("hello"), "myHelloProp");


		// test models
		expect(ww.getModelValue<String>("lateModel"), "initialized late model");
		expect(ww.getModelValue<String?>("nullableModel"), "from outside: nullableModel");
		expect(ww.getModelValue<int>("counterModel"), 1);
		expect(ww.getModelValue<String?>("optionalModel2"), "from outside: optionalModel2");


		// test emits
		expect(ww.getNumEmits("anEmit"), 0);


		await tester.pumpWithSecondsPlusTick(1);
		expect(ww.getNumEmits("anEmit"), 1);
		expect(ww.getModelValue<int>("counterModel"), 2);

		await tester.pumpWithSecondsPlusTick(1);
		expect(ww.getNumEmits("anEmit"), 2);
		expect(ww.getModelValue<int>("counterModel"), 3);


		// test widget mock
		expect(find.text("lucky number: 8888"), findsOneWidget);
	});
}
