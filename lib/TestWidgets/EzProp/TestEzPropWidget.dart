
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Sub/Sub.dart';

part "TestEzPropWidget.g.dart";

class TestEzPropWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestEzPropWidgetState();
}

@EzWidget()
class TestEzPropWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<children->
				<Text>Elapsed seconds: {{ seconds }}</Text>
				<Sub z-bind:nihao="'shijie'" z-bind:counter="seconds">
					<namedChild->
						<Container></Container>
					</namedChild->
				</Sub>
			</children->
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._seconds = 1;
	}

	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._seconds++;
		}));
	}
}