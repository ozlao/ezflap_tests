
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'Sub/Sub.dart';

part "TestEzEmitWidget.g.dart";

class TestEzEmitWidget extends EzStatefulWidgetBase {
	TestEzEmitWidget({ Key? key }) : super(key: key);

	@override
	TestEzEmitWidgetState createState() => TestEzEmitWidgetState();
}

@EzWidget()
class TestEzEmitWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>in TestEzEmitWidget</Text>    
			<Sub
				z-on:oneSecondPassed="onOneSecondPassed"
				z-on:oneSecondPassed2="onOneSecondPassed2(88)"
				z-on:someSecondsPassed="onSomeSecondsPassed"
				z-on:onPressed="onPressed"
			/>
			<Text z-for="text in arrTexts">{{ text }}</Text>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("arrTexts") RxList<String> _$arrTexts = <String>[ ].obs;


	/* BOUND METHODS (16) **/
	@EzMethod("onOneSecondPassed")
	void _boundOnOneSecondPassed() {
	    this._arrTexts.add("one second passed");
	}

	@EzMethod("onOneSecondPassed2")
	void _boundOnOneSecondPassed2(int someNumber) {
	    this._arrTexts.add("one second passed. someNumber: ${someNumber}");
	}

	@EzMethod("onSomeSecondsPassed")
	void _boundOnSomeSecondsPassed(int numSeconds) {
	    this._arrTexts.add("one some seconds passed: ${numSeconds}");
	}

	@EzMethod("onPressed")
	void _boundOnPressed() {
	    this._arrTexts.add("pressed the button");
	}
}