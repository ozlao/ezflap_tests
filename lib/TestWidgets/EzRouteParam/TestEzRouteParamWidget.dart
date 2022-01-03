
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part "TestEzRouteParamWidget.g.dart";

class ArgumentTest {
	final int answerInt;
	final String answerString;

	ArgumentTest(this.answerInt, this.answerString);
}

class TestEzRouteParamWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestEzRouteParamWidgetState();
}

@EzWidget()
class TestEzRouteParamWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>in TestEzRouteParamWidget</Text>
			<Text z-for="text in arrTexts">{{ text }}</Text>
			<TextButton z-bind:onPressed="onPressed">
				<Text>Press me</Text>
			</TextButton>
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
	    print("pressed 2!");
	    Navigator.pushReplacementNamed(context, "/page1", arguments: { "answer": 42, "data": ArgumentTest(88, "Eighty Eight") });
	}
}