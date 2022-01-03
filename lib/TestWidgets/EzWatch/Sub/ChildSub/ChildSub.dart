
import 'dart:async';

import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "ChildSub.g.dart";

class ChildSub extends EzStatefulWidgetBase {
	@override
	ChildSubState createState() => ChildSubState();
}

@EzWidget()
class ChildSubState extends _EzStateBase {
	/* MODELS (2) **/
	@EzModel("modelCnt") int? _$model_modelCnt;


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>ChildSub modelCnt: {{ modelCnt }}</Text>
		</Column>
	""";


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._model_modelCnt = 888;
	}

	@override
	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._model_modelCnt = this._model_modelCnt! + 1;
		}));
	}
}