
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';

part 'Sub.g.dart';

class Sub extends EzStatefulWidgetBase {
	@override
	SubState createState() => SubState();
}

@EzWidget()
class SubState extends _EzStateBase {
	/* MODELS (2) **/
	@EzModel() late int _$model_defModel;
	@EzModel("text") late String _$model_text;
	@EzModel("wowMe") late int _$model_wowMe;
	@EzModel("animal") late String _$model_animal;
	@EzModel("localAnimal") late String _$model_localAnimal;


	/* EVENT EMITTERS (4) **/
	@EzEmit("onChanged") late void Function() _$emitOnChanged;


	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>In Sub</Text>
			<Text>sub.isEntity2Initialized: {{ isEntity2Initialized }}</Text>
			<Text z-if="isEntity2Initialized">text: {{ text }}</Text>
			<TextButton z-bind:onPressed="onPressed">
				<Text>Button 1</Text>
			</TextButton>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("isEntity2Initialized") bool _$isEntity2Initialized = false;


	/* BOUND METHODS (16) **/
	@EzMethod("onPressed")
	void _boundOnPressed() {
	    this._model_defModel++;
	    this._model_text = "cur value: ${this._model_defModel}";
	    this._isEntity2Initialized = true;
	    this._model_wowMe++;
	    this._model_animal = "kato";
	    this._model_localAnimal = "lizardo";
	    this._emitOnChanged();
	}
}