
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestLifecycleWithInitialWidgetWidget.g.dart";

class TestLifecycleWithInitialWidgetWidget extends EzStatefulWidgetBase {
	@override
	TestLifecycleWithInitialWidgetWidgetState createState() => TestLifecycleWithInitialWidgetWidgetState();
}

@EzWidget()
class TestLifecycleWithInitialWidgetWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Container>
			<Text>state: {{ state }}</Text>
		</Container>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("state") late String _$state;


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._state = "initialized";
	}

	@override
	Future<void> hookPrepare() async {
		this._state = "prepared";
	}

	@override
	Future<void> hookReady() async {
		this._state = "ready";
	}

	@override
	Widget? hookBuildInitialWidget() {
		return Container(
			child: Text("from initial widget")
		);
	}
}