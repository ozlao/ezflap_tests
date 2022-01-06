
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestSlotsHostedWidget.g.dart';

class TestSlotsHostedWidget extends EzStatefulWidgetBase {
	@override
	TestSlotsHostedWidgetState createState() => TestSlotsHostedWidgetState();
}

@EzWidget()
class TestSlotsHostedWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>hosted widget</Text>
			<ZSlotConsumer />
			<ZSlotConsumer z-name="provider1" />
			<ZSlotConsumer z-name="provider2">
				<Text>provider2 default</Text>
			</ZSlotConsumer>
			<ZSlotConsumer z-name="unused" />
			<ZSlotConsumer z-name="unusedWithDefault">
				<Text>unusedWithDefault</Text>
			</ZSlotConsumer>
			
			<Container>
				<child->
					<ZSlotConsumer z-name="providerSingleChildNotInList">
						<Text>default for single child not in list 1</Text>
					</ZSlotConsumer>
				</child->
			</Container>
			
			<Container>
				<child->
					<ZSlotConsumer z-name="noSuchSlotProvider">
						<Text>default for single child not in list 2</Text>
					</ZSlotConsumer>
				</child->
			</Container>
			
			<Container>
				<child->
					<ZSlotConsumer z-name="providerSingleChildNotInListWithoutDefault" />
				</child->
			</Container>

			<Column>
				<children->
					<ZSlotConsumer z-name="providerSingleChildInList">
						<Text>default for single child in list 1</Text>
					</ZSlotConsumer>
				</children->
			</Column>

			<Column>
				<children->
					<ZSlotConsumer z-name="providerMultiChildInList">
						<Text>default for multi child in list (1)</Text>
						<Text>default for multi child in list (2)</Text>
						<Text>default for multi child in list (3)</Text>
					</ZSlotConsumer>
				</children->
			</Column>

			<Column>
				<children->
					<ZSlotConsumer z-name="noSuchSlotProvider">
						<Text>default for multi child not in list (1)</Text>
						<Text>default for multi child not in list (2)</Text>
						<Text>default for multi child not in list (3)</Text>
					</ZSlotConsumer>
				</children->
			</Column>

			<Column>
				<children->
					<ZSlotConsumer z-name="providerMultiChildInListWithoutDefault" />
				</children->
			</Column>

			<Column>
				<children->
					<ZSlotConsumer z-name="withScope" z-bind:item1="'hello world'" item2="{{ 'nihao' }} {{ 'shijie' }}" />
				</children->
			</Column>
		</Column>
	""";
}