
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';

part "TestEzMethodWidget.g.dart";

class TestEzMethodWidget extends EzStatefulWidgetBase {
	@override
	TestEzMethodWidgetState createState() => TestEzMethodWidgetState();
}

@EzWidget()
class TestEzMethodWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Elapsed seconds: {{ seconds }}</Text>
			<Text>Multiply: {{ multiply(seconds) }}</Text>
			<Container z-bind:color="getColor(seconds % 3)">
				<Text>Colorful</Text>
			</Container>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;


	/* BOUND METHODS (16) **/
	@EzMethod("multiply")
	int _boundMultiply(int num, [ int multiplier = 10 ]) {
	    return num * multiplier;
	}

	@EzMethod("getColor")
	Color _boundGetColor(int idx) {
		return [ Colors.red, Colors.green, Colors.blue ][idx];
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