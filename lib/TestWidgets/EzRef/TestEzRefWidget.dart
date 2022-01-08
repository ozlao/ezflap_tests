
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Sub/Sub.dart';
import 'Sub2/Sub2.dart';

part "TestEzRefWidget.g.dart";

class TestEzRefWidget extends EzStatefulWidgetBase {
	TestEzRefWidget({ Key? key }) : super(key: key);

	@override
	TestEzRefWidgetState createState() => TestEzRefWidgetState();
}

@EzWidget()
class TestEzRefWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Elapsed seconds: {{ seconds }}</Text>
			<Sub z-ref="sub"
				z-bind:counter="seconds"
				z-model="forModel"
				z-model:model1="forModel1"
				z-model:model2="forModel2"
				z-model:model4="arrKeys"
				z-model:model5="forModel5"      
				z-model:subModelCnt="forModelCnt"
			/>
			<Text>Times 420: {{ times420 }}</Text>
			<Sub2 z-refs="mapSub2s" z-refs-key="key"
				z-for="(key, idx) in arrKeys"
				z-bind:counter="seconds"
				z-bind:myText="key + '!!!'"
				z-bind:idx="idx"
			/>
			<Text>Num refs in map: {{ getNumRefsInMap() }}</Text>
			<Text>Ref {{ arrKeys[0] }}: {{ getRefCounterTimes42(arrKeys[0]) }}</Text>
			<Text>Ref {{ arrKeys[1] }}: {{ getRefCounterTimes42(arrKeys[1]) }}</Text>
			<Text>Ref {{ arrKeys[2] }}: {{ getRefCounterTimes42(arrKeys[2]) }}</Text>
			<Text>model5: {{ forModel5 }}</Text>
			<Text>model: {{ forModel }}</Text>
			<Text>Top modelCnt: {{ forModelCnt }}</Text>
			<TextButton z-bind:key="ValueKey('test1')" z-bind:onPressed="onPressed">
				<Text>Submit</Text>
			</TextButton>
		</Column>
	""";


	/* REFERENCES TO HOSTED WIDGETS (10) **/
	@EzRef("sub") SubState? _$ref_subState;
	@EzRefs("mapSub2s") late Map<String, Sub2State> _$ref_mapSub2States;


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;
	@EzField("arrKeys") List<String> _$arrKeys = [ "key1", "key2", "key3" ];
	@EzField("forModel") late String? _$forModel;
	@EzField("forModel1") String _$forModel1 = "hello world";
	@EzField("forModel2") int? _$forModel2 = 42;
	@EzField("forModel5") int? _$forModel5 = 88;
	@EzField("forModelCnt") late int? _$forModelCnt;


	/* COMPUTED VALUES (14) **/
	@EzComputed("times420")
	int _computedTimes420() {
		if (this._ref_subState == null) {
			return -1;
		}

	    int result = this._ref_subState!.getCounterTimes42() * 10;
	    return result;
	}


	/* BOUND METHODS (16) **/
	@EzMethod("onPressed")
	void _boundOnPressed() {
		print("pressed!");
	}

	@EzMethod("getNumRefsInMap")
	int _boundGetNumRefsInMap() {
	    return this._ref_mapSub2States.length;
	}

	@EzMethod("getRefCounterTimes42")
	int _boundGetRefCounterTimes42(String key) {
		Sub2State? sub = this._ref_mapSub2States[key];
		if (sub == null) {
			return 0;
		}

	    int counterTimes42 = sub.getCounterTimes42();
	    return counterTimes42;
	}


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._seconds = 1;
		this._forModel = "hi hi";
		this._forModelCnt = 888;
	}

	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._seconds++;
			this._forModel2 = this._forModel2! + 1;
		}));
	}
}