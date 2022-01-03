
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestZGroupWidget.g.dart";

class TestZGroupWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestZGroupWidgetState();
}

@EzWidget()
class TestZGroupWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>TestZGroupWidget!</Text>
			<ZGroup z-if="step >= 2 || step >= 3">
				<Text>text 1</Text>
				<Text z-if="step >= 4">text 2</Text>
				<ZGroup>
					<Text>text 3</Text>
				</ZGroup>
				<ZGroup z-if="step >= 5" z-show="step >= 6">
				</ZGroup>
				<ZGroup z-if="step >= 7" z-show="step >= 8">
					<Text z-show="step >= 9">text 4</Text>
				</ZGroup>
				<Column>
					<children->
						<ZGroup z-if="step >= 10">
							<Text z-if="step >= 11">text 5</Text>
						</ZGroup>
						<ZGroup z-if="step >= 12">
							<ZGroup z-if="step >= 13">
								<Text z-if="step >= 14">text 6</Text>
							</ZGroup>
							<Text z-for="item in arrItems" z-if="shouldInclude(item)">
								{{ item }}
							</Text>
						</ZGroup>
					</children->
				</Column>
			</ZGroup>
			<TextButton z-bind:onPressed="onPressed">
				<Text>Button 1</Text>
			</TextButton>
		</Column>	
	""";


	/* BOUND FIELDS (11) **/
	@EzField("arrItems") List<String> _$arrItems = [ "item1", "item2", "item3" ];
	@EzField("step") int _$step = 1;


	/* BOUND METHODS (16) **/
	@EzMethod("shouldInclude")
	bool _boundShouldInclude(String item) {
	    //return (this._step >= 15 && item != "item2");
	    return (item != "item2");
	}

	@EzMethod("onPressed")
	void _boundOnPressed() {
	    this._step++;
	}
}