
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "HigherParent.g.dart";

@EzWidget()
abstract class HigherParentState<T extends EzStatefulWidgetBase> extends _EzStateBase<T> {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>In HigherParent. Inheriting:</Text>
			<ZInheritingWidget />
		</Column>
	""";
}