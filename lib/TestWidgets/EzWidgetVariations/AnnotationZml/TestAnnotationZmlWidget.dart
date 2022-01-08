
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestAnnotationZmlWidget.g.dart';

class TestAnnotationZmlWidget extends EzStatefulWidgetBase {
	TestAnnotationZmlWidget({ Key? key }) : super(key: key);

	@override
	TestAnnotationZmlWidgetState createState() => TestAnnotationZmlWidgetState();
}

const String _ZML = """
	<Column>    
		<Text>member ZML</Text>
	</Column>
""";

@EzWidget(zml: _ZML)
class TestAnnotationZmlWidgetState extends _EzStateBase {

}