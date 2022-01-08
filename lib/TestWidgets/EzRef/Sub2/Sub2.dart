
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "Sub2.g.dart";

class Sub2 extends EzStatefulWidgetBase {
	Sub2({ Key? key }) : super(key: key);

	@override
	Sub2State createState() => Sub2State();
}

@EzWidget()
class Sub2State extends _EzStateBase {
	/* PROPS (3) **/
	@EzProp("idx") late int _$prop_idx;
	@EzProp("counter") late int _$prop_counter;
	@EzProp("myText") late String _$prop_myText;


	/* PUBLIC METHODS (5) **/
	int getCounterTimes42() {
		return this._prop_counter * 42 + this._prop_idx;
	}


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Counter in Sub2: {{ counter }}</Text>
			<Text>myText: {{ myText }}</Text>
		</Column>
	""";
}