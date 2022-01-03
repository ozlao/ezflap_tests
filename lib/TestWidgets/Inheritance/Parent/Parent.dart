
import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/Inheritance/HigherParent/HigherParent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "Parent.g.dart";

@EzWidget(extend: HigherParentState)
abstract class ParentState<T extends EzStatefulWidgetBase> extends _EzStateBase<T> {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>In Parent. Inheriting:</Text>
			<ZInheritingWidget />
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("parentField") late int _$parentField;
}