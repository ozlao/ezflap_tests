
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Fruit/FruitProviderBase.dart';
import 'Fruit/FruitResolver.dart';
import 'SvcOverriddenTest/SvcOverriddenTest_.dart';
import 'SvcTest/SvcTest_.dart';

part "TestEzWithDIWidget.g.dart";

class TestEzWithDIWidget extends EzStatefulWidgetBase {
	TestEzWithDIWidget({ Key? key }) : super(key: key);

	@override
	TestEzWithDIWidgetState createState() => TestEzWithDIWidgetState();
}

@EzWidget()
class TestEzWithDIWidgetState extends _EzStateBase {
	/* DEPENDENCIES (7) **/
	@EzDI() late SvcOverriddenTest _svcOverriddenTest;
	@EzDI() late SvcTest _svcTest;
	@EzDIProvider(FruitResolver) late FruitProviderBase _$fruitProvider; // --> this._fruitProvider


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>testValue: {{ testValue }}</Text>
			<Text>subTestValue: {{ subTestValue }}</Text>
			<Text>overriddenTestValue: {{ overriddenTestValue }}</Text>
			<Text>fruit name: {{ fruitName }}</Text>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;
	@EzField("testValue") late int _$testValue;
	@EzField("subTestValue") late int _$subTestValue;
	@EzField("overriddenTestValue") late int _$overriddenTestValue;
	@EzField("fruitName") late String _$fruitName; // --> this._fruitName


	/* PRIVATE METHODS (19) **/
	void _updateFruitName() {
		this._fruitName = this._fruitProvider.getFruitName();
	}


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._testValue = this._svcTest.getTestValue();
		this._subTestValue = this._svcTest.getSubTestValue();
		this._overriddenTestValue = this._svcOverriddenTest.getTestValue();
		this._updateFruitName();
	}

	Future<void> hookReady() async {
		Tick.runInMs(500, () {
			this._updateFruitName();
		});
	}
}