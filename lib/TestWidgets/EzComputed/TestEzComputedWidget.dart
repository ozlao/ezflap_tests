
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestEzComputedWidget.g.dart";

class TestEzComputedWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestEzComputedWidgetState();
}

@EzWidget()
class TestEzComputedWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Elapsed seconds: {{ seconds }}</Text>
			<Text>Multiply 1: {{ multiply }}</Text>
			<Text>Multiply 2: {{ multiply }}</Text>
			<Text>Multiply 3: {{ multiply }}</Text>
			<Text>Multiply 4: {{ multiply }}</Text>
			<Text>Multiply 5: {{ multiply }}</Text>
			<Text>Num Computed invocations: {{ numComputedInvocations }}</Text>
			<Container z-bind:color="curColor">
				<Text>Colorful</Text>
			</Container>
			<Text z-if="multiply % 3 == 1">vif: {{ multiply }}</Text>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;
	@EzField("numComputedInvocations") int _$numComputedInvocations = 0;


	/* COMPUTED VALUES (14) **/
	@EzComputed("multiply")
	int _computedMultiply() {
		Tick.runInMs(0, () => this._numComputedInvocations++);
	    return this._seconds * 10;
	}

	@EzComputed("curColor")
	Color _computedCurColor() {
		int idx = this._seconds % 3;
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