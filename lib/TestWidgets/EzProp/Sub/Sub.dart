
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "Sub.g.dart";

class Sub extends EzStatefulWidgetBase {
	Sub({ Key? key }) : super(key: key);

	@override
	SubState createState() => SubState();
}

@EzWidget()
class SubState extends _EzStateBase {
	/* PROPS (3) **/
	@EzProp("hello") String _$prop_hello = "bye";
	@EzProp("nihao") String _$prop_nihao = "zaijian";
	@EzProp("counter") late int _$prop_counter;
	@EzProp("namedChild") late List<Widget> _$prop_namedChild;


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Hello: {{ hello }}</Text>
			<Text>Nihao: {{ nihao }}</Text>
			<Text>Counter: {{ counter }}</Text>
		</Column>
	""";
}