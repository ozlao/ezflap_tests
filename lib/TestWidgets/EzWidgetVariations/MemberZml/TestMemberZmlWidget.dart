
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestMemberZmlWidget.g.dart';

class TestMemberZmlWidget extends EzStatefulWidgetBase {
	@override
	TestMemberZmlWidgetState createState() => TestMemberZmlWidgetState();
}

@EzWidget()
class TestMemberZmlWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>    
			<Text>member ZML</Text>
		</Column>
	""";
}