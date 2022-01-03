
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestMemberZmlAndAnnotationInitialZmlWidget.g.dart';

class TestMemberZmlAndAnnotationInitialZmlWidget extends EzStatefulWidgetBase {
	@override
	TestMemberZmlAndAnnotationInitialZmlWidgetState createState() => TestMemberZmlAndAnnotationInitialZmlWidgetState();
}

const String _INITIAL_ZML = """
	<Column>    
		<Text>initial ZML</Text>
	</Column>
""";

@EzWidget(initialZml: _INITIAL_ZML)
class TestMemberZmlAndAnnotationInitialZmlWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>    
			<Text>member ZML</Text>
		</Column>
	""";
}