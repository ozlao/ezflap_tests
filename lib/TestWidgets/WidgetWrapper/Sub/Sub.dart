
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "Sub.g.dart";

abstract class ISubState {
	int getLuckyNumber();
}

class Sub extends EzStatefulWidgetBase {
	@override
	SubState createState() => SubState();
}

@EzWidget()
class SubState extends _EzStateBase implements ISubState {
	/* PROPS (3) **/
	@EzProp("hello") late String _$prop_hello;


	/* PUBLIC METHODS (5) **/
	int getLuckyNumber() {
		return 99;
	}


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Hello: {{ hello }}</Text>
		</Column>
	""";
}