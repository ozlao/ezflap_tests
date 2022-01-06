
import 'package:ezflap_tests/TestWidgets/EzWidgetVariations/AnnotationZml/TestAnnotationZmlWidget.dart';
import 'package:ezflap_tests/TestWidgets/EzWidgetVariations/AnnotationZmlAndInitialZml/TestAnnotationZmlAndInitialZmlWidget.dart';
import 'package:ezflap_tests/TestWidgets/EzWidgetVariations/AnnotationZmlAndMemberInitialZml/TestAnnotationZmlAndMemberInitialZmlWidget.dart';
import 'package:ezflap_tests/TestWidgets/EzWidgetVariations/MemberZml/TestMemberZmlWidget.dart';
import 'package:ezflap_tests/TestWidgets/EzWidgetVariations/MemberZmlAndAnnotationInitialZml/TestMemberZmlAndAnnotationInitialZmlWidget.dart';
import 'package:ezflap_tests/TestWidgets/EzWidgetVariations/MemberZmlAndInitialZml/TestMemberZmlAndInitialZmlWidget.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ezflap/src/Service/EzflapTester/WidgetTesterExtension/WidgetTesterExtension.dart';

void main() {
	testWidgets("EzWidget Variations - member ZML", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestMemberZmlWidget());
		expect(find.text("member ZML"), findsOneWidget);
	});

	testWidgets("EzWidget Variations - member ZML and initial ZML", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestMemberZmlAndInitialZmlWidget(), false);
		expect(find.text("initial ZML"), findsOneWidget);
		await tester.pumpTick();
		expect(find.text("member ZML"), findsOneWidget);
	});

	testWidgets("EzWidget Variations - annotation ZML", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestAnnotationZmlWidget());
		expect(find.text("member ZML"), findsOneWidget);
	});

	testWidgets("EzWidget Variations - annotation ZML and initial ZML", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestAnnotationZmlAndInitialZmlWidget(), false);
		expect(find.text("initial ZML"), findsOneWidget);
		await tester.pumpTick();
		expect(find.text("member ZML"), findsOneWidget);
	});

	testWidgets("EzWidget Variations - member ZML and annotation initial ZML", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestMemberZmlAndAnnotationInitialZmlWidget(), false);
		expect(find.text("initial ZML"), findsOneWidget);
		await tester.pumpTick();
		expect(find.text("member ZML"), findsOneWidget);
	});

	testWidgets("EzWidget Variations - annotation ZML and member initial ZML", (WidgetTester tester) async {
		await tester.pumpWidgetIntoScaffold(TestAnnotationZmlAndMemberInitialZmlWidget(), false);
		expect(find.text("initial ZML"), findsOneWidget);
		await tester.pumpTick();
		expect(find.text("member ZML"), findsOneWidget);
	});
}
