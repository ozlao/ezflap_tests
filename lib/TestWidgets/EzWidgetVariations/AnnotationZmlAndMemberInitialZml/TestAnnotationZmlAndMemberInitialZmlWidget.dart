
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestAnnotationZmlAndMemberInitialZmlWidget.g.dart';

class TestAnnotationZmlAndMemberInitialZmlWidget extends EzStatefulWidgetBase {
	TestAnnotationZmlAndMemberInitialZmlWidget({ Key? key }) : super(key: key);

	@override
	TestAnnotationZmlAndMemberInitialZmlWidgetState createState() => TestAnnotationZmlAndMemberInitialZmlWidgetState();
}

const String _ZML = """
	<Column>    
		<Text>member ZML</Text>
	</Column>
""";

@EzWidget(zml: _ZML)
class TestAnnotationZmlAndMemberInitialZmlWidgetState extends _EzStateBase {
	static const String _INITIAL_ZML = """
		<Column>    
			<Text>initial ZML</Text>
		</Column>
	""";
}