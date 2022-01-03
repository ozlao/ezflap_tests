
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestMemberZmlAndInitialZmlWidget.g.dart';

class TestMemberZmlAndInitialZmlWidget extends EzStatefulWidgetBase {
	@override
	TestMemberZmlAndInitialZmlWidgetState createState() => TestMemberZmlAndInitialZmlWidgetState();
}

@EzWidget()
class TestMemberZmlAndInitialZmlWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _INITIAL_ZML = """
		<Column>    
			<Text>initial ZML</Text>
		</Column>
	""";

	static const String _ZML = """
		<Column>    
			<Text>member ZML</Text>
		</Column>
	""";
}