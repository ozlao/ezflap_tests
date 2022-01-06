
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'MyReactiveEntity/MyReactiveEntity.dart';
import 'Sub/Sub.dart';

part "TestEzReactiveWidget.g.dart";

class TestEzReactiveWidget extends EzStatefulWidgetBase {
	@override
	TestEzReactiveWidgetState createState() => TestEzReactiveWidgetState();
}

@EzWidget()
class TestEzReactiveWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>TestEzReactiveWidget!</Text>
			<Text>entity1.hello1: {{ entity1.hello1 }}</Text>
			<Text>entity1.hello2: {{ entity1.hello2 }}</Text>
			<Sub
				z-model="entity2.hello1"
				z-model:text="entity2.hello2"
				z-model:wowMe="entity1.other.wow"
				z-model:animal="entity1.arrAnimals[1]"
				z-model:localAnimal="arrLocalAnimals[1]"
				z-on:onChanged="onChanged"
			/>
			<Text>isEntity2Initialized: {{ isEntity2Initialized }}</Text>
			<Text z-if="isEntity2Initialized">
				 entity2.hello1: {{ entity2.hello1 }}
				 entity2.hello2: {{ entity2.hello2 }}
			</Text>
			<Text>
				entity1.other.wow: {{ entity1.other.wow }}
			</Text>
			<Text>
				entity1.arrAnimals[1]: {{ entity1.arrAnimals[1] }}
			</Text>
			<Text>
				arrLocalAnimals[1]: {{ arrLocalAnimals[1] }}
			</Text>
		</Column>	
	""";


	/* BOUND FIELDS (11) **/
	@EzField("entity1") MyReactiveEntity _$entity1 = MyReactiveEntity();
	@EzField("entity2") MyReactiveEntity _$entity2 = MyReactiveEntity();
	@EzField("isEntity2Initialized") bool _$isEntity2Initialized = false;
	@EzField("arrLocalAnimals") RxList<String> _$arrLocalAnimals = [ "shark", "lizard", "sloth" ].obs; // --> this._arrLocalAnimals


	/* BOUND METHODS (16) **/
	@EzMethod("make")
	Widget _boundMake() {
	    return Text("built with make()");
	}

	@EzMethod("onChanged")
	void _boundOnChanged() {
	    this._isEntity2Initialized = true;
	}


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._entity1.hello1 = 88;
		this._entity1.hello2 = "shijie";
		this._entity2.hello1 = 42;
	}

	@override
	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._entity1.hello1++;
		}));
	}
}