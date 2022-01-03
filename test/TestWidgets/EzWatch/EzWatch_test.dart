
import 'package:ezflap_tests/TestWidgets/EzWatch/TestEzWatchWidget.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../Utils/TestUtils.dart';

import 'package:ezflap/ezflap.dart';

void main() {
	testWidgets("EzWatch tests", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestEzWatchWidget());

		// sanity assertion
		expect(find.textContaining("int field"), findsOneWidget);

		// actual assertions
		expect(find.textContaining("int field: field: 1, old: -1, new: -1"), findsOneWidget);
		expect(find.textContaining("String field: field: a, old: N/A, new: N/A"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 10, old: -1, new: -1"), findsOneWidget);
		expect(find.textContaining("int prop: prop: 1, old: -1, new: -1"), findsOneWidget);
		expect(find.textContaining("int model: model: 42, old: -1, new: -1"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.textContaining("int field: field: 2, old: 1, new: 2"), findsOneWidget);
		expect(find.textContaining("String field: field: aa, old: a, new: aa"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 20, old: 10, new: 20"), findsOneWidget);
		expect(find.textContaining("int prop: prop: 1, old: -1, new: -1"), findsOneWidget);
		expect(find.textContaining("int model: model: 42, old: -1, new: -1"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.textContaining("int field: field: 3, old: 2, new: 3"), findsOneWidget);
		expect(find.textContaining("String field: field: aaa, old: aa, new: aaa"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 30, old: 20, new: 30"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.textContaining("int field: field: 4, old: 3, new: 4"), findsOneWidget);
		expect(find.textContaining("String field: field: aaaa, old: aaa, new: aaaa"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 40, old: 30, new: 40"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.textContaining("int field: field: 5, old: 4, new: 5"), findsOneWidget);
		expect(find.textContaining("String field: field: aaaaa, old: aaaa, new: aaaaa"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 50, old: 40, new: 50"), findsOneWidget);

		await tester.tapTextButton();
		expect(find.textContaining("int field: field: 6, old: 5, new: 6"), findsOneWidget);
		expect(find.textContaining("String field: field: aaaaaa, old: aaaaa, new: aaaaaa"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 60, old: 50, new: 60"), findsOneWidget);

		await tester.pumpWithSecondsPlusTick(1);
		expect(find.textContaining("int field: field: 6, old: 5, new: 6"), findsOneWidget);
		expect(find.textContaining("String field: field: aaaaaa, old: aaaaa, new: aaaaaa"), findsOneWidget);
		expect(find.textContaining("int computed: computed: 60, old: 50, new: 60"), findsOneWidget);
		expect(find.textContaining("int prop: prop: 2, old: 1, new: 2"), findsOneWidget);
		expect(find.textContaining("int model: model: 43, old: 42, new: 43"), findsOneWidget);

		await tester.pumpWithSecondsPlusTick(1);
		expect(find.textContaining("int prop: prop: 3, old: 2, new: 3"), findsOneWidget);
		expect(find.textContaining("int model: model: 44, old: 43, new: 44"), findsOneWidget);

		await tester.pumpWithSecondsPlusTick(1);
		expect(find.textContaining("int prop: prop: 4, old: 3, new: 4"), findsOneWidget);
		expect(find.textContaining("int model: model: 45, old: 44, new: 45"), findsOneWidget);
	});
}
