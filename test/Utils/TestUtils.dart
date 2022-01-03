
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
	Future<void> tapTextButton() async {
		await this.tap(find.byType(TextButton));
		await this.pumpTick();
	}
}

extension FinderExtension on Finder {
	T as<T extends Widget>() {
		expect(this, findsOneWidget);
		Element element = this.evaluate().single;
		Widget widget = element.widget;
		T t = widget as T;
		return t;
	}
}

extension a on CommonFinders {
	T as<T extends Widget>() {
		return this.byType(T).as();
	}
}
