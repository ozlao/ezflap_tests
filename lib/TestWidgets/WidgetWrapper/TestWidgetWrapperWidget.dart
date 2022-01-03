
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Sub/Sub.dart';

part "TestWidgetWrapperWidget.g.dart";

class TestWidgetWrapperWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestWidgetWrapperWidgetState();
}

@EzWidget()
class TestWidgetWrapperWidgetState extends _EzStateBase {
	/* ROUTE PARAMS (1) **/
	@EzRouteParam("routeValue") late int _$routeValue;


	/* MODELS (2) **/
	@EzModel("lateModel") late String _$model_lateModel;
	@EzModel("nullableModel") String? _$model_nullableModel;
	@EzModel("counterModel") late int _$model_counterModel;
	@EzOptionalModel("optionalModel1") String? _$model_optionalModel1;
	@EzOptionalModel("optionalModel2") String? _$model_optionalModel2;


	/* PROPS (3) **/
	@EzProp("hello") late String _$prop_hello;
	@EzProp("answer") int? _$prop_answer;


	/* EVENT EMITTERS (4) **/
	@EzEmit("anEmit") late void Function() _$emitAnEmit;


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>hello: {{ hello }}</Text>
			<Text>answer: {{ answer }}</Text>
			<Text>routeValue: {{ routeValue }}</Text>
			<Text>lucky number: {{ luckyNumber }}</Text>
			<Sub z-ref="sub" hello="myHelloProp" />
		</Column>
	""";


	/* REFERENCES TO HOSTED WIDGETS (10) **/
	@EzRef("sub") ISubState? _$ref_subState;


	/* BOUND FIELDS (11) **/
	@EzField("seconds") int _$seconds = 0;
	@EzField("luckyNumber") int _$luckyNumber = 0;


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._model_lateModel = "initialized late model";
		this._model_counterModel = 1;
	}

	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._seconds++;
			this._model_counterModel++;
			this._emitAnEmit();
			this._luckyNumber = this._ref_subState!.getLuckyNumber();
		}));
	}
}