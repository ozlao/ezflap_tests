
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestLifecycleOnlyPrimaryWidget.g.dart";

class TestLifecycleOnlyPrimaryWidget extends EzStatefulWidgetBase {
	@override
	TestLifecycleOnlyPrimaryWidgetState createState() => TestLifecycleOnlyPrimaryWidgetState();
}

@EzWidget()
class TestLifecycleOnlyPrimaryWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>aaa</Text>
			<Text>state: {{ state }}</Text>
		</Column>
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
}