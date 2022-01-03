
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestMemberZssWidget.g.dart';

class TestMemberZssWidget extends EzStatefulWidgetBase {
	@override
	TestMemberZssWidgetState createState() => TestMemberZssWidgetState();
}


const String _ZSS = """
	ANNOTATION_ZSS
""";

const String _ZSSES1 = """
	ANNOTATION_ZSSES1
""";

const String _ZSSES2 = """
	ANNOTATION_ZSSES2
""";

const String _ZSSES3 = """
	ANNOTATION_ZSSES3
""";

@EzWidget(zss: _ZSS, zsses: [ _ZSSES1, _ZSSES2, _ZSSES3 ])
class TestMemberZssWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>    
			<Text>member ZML</Text>
		</Column>
	""";


	/* ZSS (9) **/
	static const String _ZSS = """
		MEMBER_ZSS
	""";
}