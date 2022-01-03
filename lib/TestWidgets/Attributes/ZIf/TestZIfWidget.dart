
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestZIfWidget.g.dart';

class TestZIfWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestZIfWidgetState();
}

@EzWidget()
class TestZIfWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>    
			<Text>text 1</Text>
			<Text z-if="cnt % 2 == 1">odd</Text>
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