
import 'package:ezflap_tests/TestWidgets/Attributes/ZFor/TestZForWidget.dart';
import 'package:ezflap_tests/TestWidgets/Attributes/ZIf/TestZIfWidget.dart';
import 'package:ezflap_tests/TestWidgets/Attributes/ZShow/TestZShowWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/ezflap.dart';

void main() {
	testWidgets("Attributes - z-if", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestZIfWidget());
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd"), findsNothing);
		expect(find.text("text (odd) state true"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd"), findsNothing);
	});

	testWidgets("Attributes - z-show", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestZShowWidget());
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd", skipOffstage: false), findsOneWidget);
		expect(find.text("odd"), findsNothing);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd", skipOffstage: false), findsOneWidget);
		expect(find.text("odd"), findsOneWidget);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd", skipOffstage: false), findsOneWidget);
		expect(find.text("odd"), findsNothing);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd", skipOffstage: false), findsOneWidget);
		expect(find.text("odd"), findsOneWidget);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("text 1"), findsOneWidget);
		expect(find.text("odd", skipOffstage: false), findsOneWidget);
		expect(find.text("odd"), findsNothing);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(7);
		expect(find.text("even, above 10", skipOffstage: false), findsOneWidget);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("even, above 10", skipOffstage: false), findsOneWidget);
		expect(find.text("even, above 10"), findsOneWidget);

		await tester.pumpWithSeconds(1);
		expect(find.text("even, above 10", skipOffstage: false), findsOneWidget);
		expect(find.text("even, above 10"), findsNothing);

		await tester.pumpWithSeconds(1);
		expect(find.text("even, above 10", skipOffstage: false), findsOneWidget);
		expect(find.text("even, above 10"), findsOneWidget);
	});

	testWidgets("Attributes - z-for", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestZForWidget());
		expect(find.text("text 1"), findsOneWidget);

		List<String> arr = [ "T1", "T2", "T3" ];
		List<String> arrCol = [ "C1", "C2", "C3" ];
		Map<String, String> map = { "K1": "V1", "K2": "V2", "K3": "V3" };

		var func = (bool odd, bool over10) {
			for (int i = 0; i < 3; i++) {
				expect(find.text("for1: ${arr[i]}"), findsOneWidget);
				expect(find.text("for2: idx=${i}, v=${arr[i]}"), findsOneWidget);
				expect(find.text("for3 (odd): v=${arr[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("for4 (even): v=${arr[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("for4 (even): v=${arr[i]}", skipOffstage: false), findsOneWidget);
				expect(find.text("for5 (even, > 10): v=${arr[i]}"), (over10 ? (odd ? findsNothing : findsOneWidget) : findsNothing));
				expect(find.text("for5 (even, > 10): v=${arr[i]}", skipOffstage: false), (over10 ? findsOneWidget : findsNothing));

				expect(find.text("forSet1: ${arr[i]}"), findsOneWidget);
				expect(find.text("forSet2: idx=${i}, v=${arr[i]}"), findsOneWidget);
				expect(find.text("forSet3 (odd): v=${arr[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("forSet4 (even): v=${arr[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("forSet4 (even): v=${arr[i]}", skipOffstage: false), findsOneWidget);
				expect(find.text("forSet5 (even, > 10): v=${arr[i]}"), (over10 ? (odd ? findsNothing : findsOneWidget) : findsNothing));
				expect(find.text("forSet5 (even, > 10): v=${arr[i]}", skipOffstage: false), (over10 ? findsOneWidget : findsNothing));

				expect(find.text("map1: ${map.values.toList()[i]}"), findsOneWidget);
				expect(find.text("map2: idx=${map.keys.toList()[i]}, v=${map.values.toList()[i]}"), findsOneWidget);
				expect(find.text("map3 (odd): v=${map.values.toList()[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("map4 (even): v=${map.values.toList()[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("map4 (even): v=${map.values.toList()[i]}", skipOffstage: false), findsOneWidget);
				expect(find.text("map5 (even, > 10): v=${map.values.toList()[i]}"), (over10 ? odd ? findsNothing : findsOneWidget : findsNothing));
				expect(find.text("map5 (even, > 10): v=${map.values.toList()[i]}", skipOffstage: false), (over10 ? findsOneWidget : findsNothing));

				expect(find.text("s1v1: ${arrCol[i]} - v2: ${arr[i]}"), findsOneWidget);
				expect(find.text("s2v1 (odd): ${arrCol[i]} - v2: ${arr[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("s2v1 (even): ${arrCol[i]} - v2: ${arr[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("s3v1 (odd, > 10): ${arrCol[i]} - v2: ${arr[i]}"), (over10 ? (odd ? findsOneWidget : findsNothing) : findsNothing));

				expect(find.text("map6: idx=${i}, key=${map.keys.toList()[i]}, v=${map.values.toList()[i]}"), findsOneWidget);




				expect(find.text("rxFor1: ${arr[i]}"), findsOneWidget);
				expect(find.text("rxFor2: idx=${i}, v=${arr[i]}"), findsOneWidget);
				expect(find.text("rxFor3 (odd): v=${arr[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("rxFor4 (even): v=${arr[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("rxFor4 (even): v=${arr[i]}", skipOffstage: false), findsOneWidget);
				expect(find.text("rxFor5 (even, > 10): v=${arr[i]}"), (over10 ? (odd ? findsNothing : findsOneWidget) : findsNothing));
				expect(find.text("rxFor5 (even, > 10): v=${arr[i]}", skipOffstage: false), (over10 ? findsOneWidget : findsNothing));

				expect(find.text("rxForSet1: ${arr[i]}"), findsOneWidget);
				expect(find.text("rxForSet2: idx=${i}, v=${arr[i]}"), findsOneWidget);
				expect(find.text("rxForSet3 (odd): v=${arr[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("rxForSet4 (even): v=${arr[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("rxForSet4 (even): v=${arr[i]}", skipOffstage: false), findsOneWidget);
				expect(find.text("rxForSet5 (even, > 10): v=${arr[i]}"), (over10 ? (odd ? findsNothing : findsOneWidget) : findsNothing));
				expect(find.text("rxForSet5 (even, > 10): v=${arr[i]}", skipOffstage: false), (over10 ? findsOneWidget : findsNothing));

				expect(find.text("rxMap1: ${map.values.toList()[i]}"), findsOneWidget);
				expect(find.text("rxMap2: idx=${map.keys.toList()[i]}, v=${map.values.toList()[i]}"), findsOneWidget);
				expect(find.text("rxMap3 (odd): v=${map.values.toList()[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("rxMap4 (even): v=${map.values.toList()[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("rxMap4 (even): v=${map.values.toList()[i]}", skipOffstage: false), findsOneWidget);
				expect(find.text("rxMap5 (even, > 10): v=${map.values.toList()[i]}"), (over10 ? odd ? findsNothing : findsOneWidget : findsNothing));
				expect(find.text("rxMap5 (even, > 10): v=${map.values.toList()[i]}", skipOffstage: false), (over10 ? findsOneWidget : findsNothing));

				expect(find.text("rxS1v1: ${arrCol[i]} - v2: ${arr[i]}"), findsOneWidget);
				expect(find.text("rxS2v1 (odd): ${arrCol[i]} - v2: ${arr[i]}"), (odd ? findsOneWidget : findsNothing));
				expect(find.text("rxS2v1 (even): ${arrCol[i]} - v2: ${arr[i]}"), (odd ? findsNothing : findsOneWidget));
				expect(find.text("rxS3v1 (odd, > 10): ${arrCol[i]} - v2: ${arr[i]}"), (over10 ? (odd ? findsOneWidget : findsNothing) : findsNothing));

				expect(find.text("rxMap6: idx=${i}, key=${map.keys.toList()[i]}, v=${map.values.toList()[i]}"), findsOneWidget);
			}
		};

		func(false, false);
		await tester.pumpWithSeconds(1); // --> 1
		func(true, false);
		await tester.pumpWithSeconds(1); // --> 2
		func(false, false);
		await tester.pumpWithSeconds(1); // --> 3
		func(true, false);
		await tester.pumpWithSeconds(1); // --> 4
		func(false, false);
		await tester.pumpWithSeconds(7); // --> 11
		func(true, true);
		await tester.pumpWithSeconds(1); // --> 12
		func(false, true);
		await tester.pumpWithSeconds(1); // --> 13
		func(true, true);
		await tester.pumpWithSeconds(1); // --> 14
		func(false, true);
	});

}
