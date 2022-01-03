
import 'dart:async';

import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/EzRef/Sub/ChildSub/ChildSub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "Sub.g.dart";

class Sub extends EzStatefulWidgetBase {
	@override
	SubState createState() => SubState();
}

@EzWidget()
class SubState extends _EzStateBase {
	/* MODELS (2) **/
	@EzModel() String? _$model_defModel;
	@EzModel("model1") late String _$model_model1;
	@EzOptionalModel("model2") int? _$model_model2 = 42;
	@EzOptionalModel("model3") List<String> _$model_model3 = [ "item1", "item2", "item3" ];
	@EzModel("model4") late List<String> _$model_model4;
	@EzModel("model5") int? _$model_model5;
	@EzModel("subModelCnt") late int? _$model_subModelCnt;


	/* PROPS (3) **/
	@EzProp("counter") late int _$prop_counter;


	/* PUBLIC METHODS (5) **/
	int getCounterTimes42() {
		return this._prop_counter * 42;
	}


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Counter: {{ counter }}</Text>
			<Text>model1: {{ model1 }}</Text>
			<Text>model2: {{ model2 }}</Text>
			<Text>model3[1]: {{ model3[1] }}</Text>
			<Text>model4[2]: {{ model4[2] }}</Text>
			<ChildSub z-model:modelCnt="subModelCnt" />
			<Text>-Sub modelCnt: {{ subModelCnt }}</Text>
		</Column>
	""";

	
	/* LIFECYCLE (20) **/
	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._model_model5 = this._model_model5! + 1;
		}));
	}
}