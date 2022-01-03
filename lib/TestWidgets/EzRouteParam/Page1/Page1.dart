
import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/EzRouteParam/TestEzRouteParamWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "Page1.g.dart";

class Page1 extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => Page1State();
}

@EzWidget()
class Page1State extends _EzStateBase {
	/* ROUTE PARAMS (1) **/
	@EzRouteParam("answer") late int _$answer;
	@EzRouteParam("data") late ArgumentTest _$receivedData;


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>in Page1</Text>
			<Text>Answer: {{ answer }}</Text>
			<Text>Data: {{ data.answerInt }} and {{ data.answerString }}</Text>
			<TextButton z-bind:onPressed="onPressed">
				<Text>Nav to Home</Text>
			</TextButton>
		</Column>
	""";


	/* BOUND METHODS (16) **/
	@EzMethod("onPressed")
	void _boundOnPressed() {
	    Navigator.pushReplacementNamed(context, "/home");
	}


	/* LIFECYCLE (20) **/
	Future<void> hookReady() async {
		print("received data text: ${this._receivedData.answerString}");
	}
}