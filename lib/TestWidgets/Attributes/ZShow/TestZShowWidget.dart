
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestZShowWidget.g.dart';

class TestZShowWidget extends EzStatefulWidgetBase {
	@override
	TestZShowWidgetState createState() => TestZShowWidgetState();
}

@EzWidget()
class TestZShowWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>text 1</Text>
			<Text z-show="cnt % 2 == 1">odd</Text>
			<Text z-if="cnt > 10" z-show="cnt % 2 == 0">even, above 10</Text>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("cnt") int _$cnt = 0;


	/* LIFECYCLE (20) **/
	@override
	Future<void> hookReady() async {
		var funcUnsubscribe = Tick.periodic(1000, () {
			this._cnt++;
		});
		this.onDispose(funcUnsubscribe);
	}
}