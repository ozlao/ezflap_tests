
import 'dart:async';

import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/Inheritance/Parent/Parent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestInheritanceWidget.g.dart";

class TestInheritanceWidget extends EzStatefulWidgetBase {
	TestInheritanceWidget({ Key? key }) : super(key: key);

	@override
	TestInheritanceWidgetState createState() => TestInheritanceWidgetState();
}

@EzWidget(extend: ParentState)
class TestInheritanceWidgetState extends _EzStateBase<TestInheritanceWidget> {
	/* PROPS (3) **/
	@EzProp("hello") String _$prop_hello = "bye";


	/* ZML (8) **/
	static const String _ZML = """
		<Container>
			<Text>In TestInheritanceWidget!</Text>
		</Container>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;
	@EzField("additional") int _$additional = 0;


	/* BOUND METHODS (16) **/
	@EzMethod("openItem")
	void _boundOpenItem(int a, Map<String, String> b, Column c, [ String d = "hello" ]) {

	}


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._seconds = 1;
	}

	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._seconds++;
		}));
	}
}