
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Sub/Sub.dart';

part "TestEzWatchWidget.g.dart";

class TestEzWatchWidget extends EzStatefulWidgetBase {
	TestEzWatchWidget({ Key? key }) : super(key: key);

	@override
	TestEzWatchWidgetState createState() => TestEzWatchWidgetState();
}

@EzWidget()
class TestEzWatchWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>In TestEzWatchWidget</Text>
			<Sub z-bind:intProp="seconds"></Sub>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;


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