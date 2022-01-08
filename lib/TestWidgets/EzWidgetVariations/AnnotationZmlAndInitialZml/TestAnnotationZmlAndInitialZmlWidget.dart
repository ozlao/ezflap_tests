
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestAnnotationZmlAndInitialZmlWidget.g.dart';

class TestAnnotationZmlAndInitialZmlWidget extends EzStatefulWidgetBase {
	TestAnnotationZmlAndInitialZmlWidget({ Key? key }) : super(key: key);

	@override
	TestAnnotationZmlAndInitialZmlWidgetState createState() => TestAnnotationZmlAndInitialZmlWidgetState();
}

const String _ZML = """
	<Column>    
		<Text>member ZML</Text>
	</Column>
""";

const String _INITIAL_ZML = """
	<Column>    
		<Text>initial ZML</Text>
	</Column>
""";

@EzWidget(zml: _ZML, initialZml: _INITIAL_ZML)
class TestAnnotationZmlAndInitialZmlWidgetState extends _EzStateBase {

}