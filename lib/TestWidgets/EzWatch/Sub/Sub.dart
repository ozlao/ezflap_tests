
import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/EzRef/Sub/ChildSub/ChildSub.dart';
import 'package:flutter/material.dart';

part "Sub.g.dart";

class Sub extends EzStatefulWidgetBase {
	@override
	SubState createState() => SubState();
}

@EzWidget()
class SubState extends _EzStateBase {
	/* PROPS (3) **/
	@EzProp("intProp") late int _$prop_intProp;


	/* ZML (8) **/
	static const String _INITIAL_ZML = """
		<Container></Container>
	""";

	static const String _ZML = """
		<Column>
			<Text>
				int field: field: {{ intField }}, old: {{ oldIntField }}, new: {{ newIntField }}
				String field: field: {{ stringField }}, old: {{ oldStringField }}, new: {{ newStringField }}
				int computed: computed: {{ intComputed }}, old: {{ oldIntComputed }}, new: {{ newIntComputed }}
				int prop: prop: {{ intProp }}, old: {{ oldIntProp }}, new: {{ newIntProp }}
				int model: model: {{ intModel }}, old: {{ oldIntModel }}, new: {{ newIntModel }}
			</Text>
			<ChildSub z-model:modelCnt="intModel" />
			<TextButton z-bind:onPressed="onPressed">
				<Text>Button 1</Text>
			</TextButton>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("intField") late int _$intField;
	@EzField("oldIntField") int _$oldIntField = -1;
	@EzField("newIntField") int _$newIntField = -1;

	@EzField("stringField") late String _$stringField;
	@EzField("oldStringField") String _$oldStringField = "N/A";
	@EzField("newStringField") String _$newStringField = "N/A";

	@EzField("newIntComputed") int _$newIntComputed = -1;
	@EzField("oldIntComputed") int _$oldIntComputed = -1;

	@EzField("newIntProp") int _$newIntProp = -1;
	@EzField("oldIntProp") int _$oldIntProp = -1;

	@EzField("intModel") late int? _$intModel;
	@EzField("newIntModel") int? _$newIntModel = -1;
	@EzField("oldIntModel") int? _$oldIntModel = -1;


	/* COMPUTED PROPERTIES (14) **/
	@EzComputed("intComputed")
	int _computedIntComputed() {
		int ret = this._intField * 10;
		return ret;
	}


	/* BOUND METHODS (16) **/
	@EzMethod("onPressed")
	void _boundOnPressed() {
	    this._intField++;
	    this._stringField += "a";
	}


	/* WATCHES (17) **/
	@EzWatch("intField")
	void _watchIntField(int newValue, int oldValue) {
		this._oldIntField = oldValue;
		this._newIntField = newValue;
	}
	
	@EzWatch("stringField")
	void _watchStringField(String newValue, String oldValue) {
		this._oldStringField = oldValue;
		this._newStringField = newValue;
	}
	
	@EzWatch("intComputed")
	void _watchIntComputed(int newValue, int oldValue) {
		this._oldIntComputed = oldValue;
		this._newIntComputed = newValue;
	}
	
	@EzWatch("intProp")
	void _watchIntProp(int newValue, int oldValue) {
		this._oldIntProp = oldValue;
		this._newIntProp = newValue;
	}

	@EzWatch("intModel")
	void _watchIntModel(int newValue, int oldValue) {
		this._oldIntModel = oldValue;
		this._newIntModel = newValue;
	}


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._intField = 1;
		this._stringField = "a";
		this._intModel = 42;
	}
}