
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestZBuildWidget.g.dart";

class TestZBuildWidget extends EzStatefulWidgetBase {
	@override
	TestZBuildWidgetState createState() => TestZBuildWidgetState();
}

@EzWidget()
class TestZBuildWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>TestZBuildWidget!</Text>
			<ZBuild z-build="make()" />
			<ZBuild z-builder="builder" />
		</Column>	
	""";


	/* COMPUTED VALUES (14) **/
	@EzComputed("builder")
	Widget Function(BuildContext) _computedBuilder() {
		return (BuildContext context) {
			return Text("built with builder!");
		};
	}


	/* BOUND METHODS (16) **/
	@EzMethod("make")
	Widget _boundMake() {
	    return Text("built with make()");
	}
}
