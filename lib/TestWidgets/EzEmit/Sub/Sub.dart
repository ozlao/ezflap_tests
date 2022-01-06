
import 'dart:async';

import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';

part 'Sub.g.dart';

class Sub extends EzStatefulWidgetBase {
	@override
	SubState createState() => SubState();
}

@EzWidget()
class SubState extends _EzStateBase {
	/* PROPS (3) **/
	@EzProp("hello") String _$prop_hello = "bye";
	
	
	/* EVENT EMITTERS (4) **/
	@EzEmit("oneSecondPassedAndNotHandled") late void Function() _$emitOneSecondPassedAndNotHandled;
	@EzEmit("oneSecondPassedAndNotHandledWithParam") late void Function(int) _$emitOneSecondPassedAndNotHandledWithParam;
	@EzEmit("oneSecondPassed") late void Function() _$emitOneSecondPassed;
	@EzEmit("oneSecondPassed2") late void Function() _$emitOneSecondPassed2;
	@EzEmit("someSecondsPassed") late void Function(int) _$emitSomeSecondsPassed;
	@EzEmit("onPressed") late void Function() _$emitOnPressed;


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>In Sub! Hello: {{ hello }}</Text>
			<TextButton z-bind:onPressed="onPressed">
				<Text>Button 1</Text>
			</TextButton>
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
			this._emitOneSecondPassedAndNotHandled();
			this._emitOneSecondPassedAndNotHandledWithParam(42);
			this._emitOneSecondPassed();
			this._emitOneSecondPassed2();
			this._emitSomeSecondsPassed(this._seconds);
		}));
	}
}