
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestLifecycleWithInitialZmlWidget.g.dart";

class TestLifecycleWithInitialZmlWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestLifecycleWithInitialZmlWidgetState();
}

@EzWidget()
class TestLifecycleWithInitialZmlWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _INITIAL_ZML = """
		<Container>
			<Text>from initial zml. state: {{ state }}</Text>
		</Container>
	""";

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
		this._state = "preparing";
		await Tick.awaitMs(2000);
	}

	@override
	Future<void> hookReady() async {
		this._state = "ready";
	}
}