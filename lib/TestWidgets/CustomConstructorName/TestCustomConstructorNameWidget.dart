
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestCustomConstructorNameWidget.g.dart';

class TestCustomConstructorNameWidget extends EzStatefulWidgetBase {
	TestCustomConstructorNameWidget({ Key? key }) : super(key: key);

	@override
	TestCustomConstructorNameWidgetState createState() => TestCustomConstructorNameWidgetState();
}

@EzWidget()
class TestCustomConstructorNameWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text z-constructor="rich">
				<:0->
					<TextSpan>
						<text->
							"hello world"
						</text->
					</TextSpan>
				</:0->
			</Text>
		</Column>
	""";
}