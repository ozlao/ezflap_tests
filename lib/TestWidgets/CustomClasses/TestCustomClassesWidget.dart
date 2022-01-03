
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part 'TestCustomClassesWidget.g.dart';

class TestCustomClassesWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestCustomClassesWidgetState();
}

class MyClass {
	bool state = true;
	Rx<bool> rxState = true.obs;
	int num = 0;

	MyClass(int aNum) {
		this.num = aNum;
	}
}

@EzWidget()
class TestCustomClassesWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>    
			<Text>text 1</Text>
			<Text>state: {{ myClassVar.state }}</Text>
			<Text>rxState: {{ myClassVar.rxState.value }}</Text>
			<Text z-show="myClassVar.state == false">state (show): {{ myClassVar.state }}</Text>
			<Text z-if="myClassVar.state == true" z-show="myClassVar.rxState.value == false">rxState (if and show): {{ myClassVar.rxState.value }}</Text>
			<Text>computed: {{ multiply }}</Text>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("cnt") int _$cnt = 0;
	@EzField("myClassVar") MyClass _$myClassVar = MyClass(42);
	@EzField("numComputedInvocations") int _$numComputedInvocations = 0;
	@EzField("multiply2") int _$multiply2 = 0;


	/* COMPUTED VALUES (14) **/
	@EzComputed("multiply")
	int _computedMultiply() {
		Tick.runInMs(0, () => this._numComputedInvocations++);
	    int ret = this._myClassVar.num * 1;
	    return ret;
	}


	/* LIFECYCLE (20) **/
	@override
	Future<void> hookReady() async {
		var funcUnsubscribe = Tick.periodic(1000, () {
			this._myClassVar = MyClass(this._cnt);
			this._cnt++;

			if (this._cnt % 2 == 0) {
				this._myClassVar.rxState.value = !this._myClassVar.rxState.value;
			}
		});
		this.onDispose(funcUnsubscribe);
	}
}