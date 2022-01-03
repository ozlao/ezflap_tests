
import 'dart:async';

import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Hosted/TestSlotsHostedWidget.dart';

part 'TestSlotsHostWidget.g.dart';

class TestSlotsHostWidget extends EzStatefulWidgetBase {
	@override
	TestSlotsHostWidgetState createState() => TestSlotsHostWidgetState();
}

@EzWidget()
class TestSlotsHostWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>host widget</Text>
			<TestSlotsHostedWidget>
				<Text>provider: anonymous</Text>
				<ZSlotProvider z-name="provider1">
					<Text>provider: one</Text>
				</ZSlotProvider>
				<ZSlotProvider z-name="provider2">
					<Text>provider: two</Text>
				</ZSlotProvider>
				
				<ZSlotProvider z-name="providerSingleChildNotInList">
					<Text>single child not in list</Text>
				</ZSlotProvider>
				
				<ZSlotProvider z-name="providerSingleChildNotInListWithoutDefault">
					<Text>single child not in list without default</Text>
				</ZSlotProvider>
				
				<ZSlotProvider z-name="providerSingleChildInList">
					<Text>single child in list</Text>
				</ZSlotProvider>
				
				<ZSlotProvider z-name="providerMultiChildInList">
					<Text>multi child in list (1)</Text>
					<Text>multi child in list (2)</Text>
					<Text>multi child in list (3)</Text>
				</ZSlotProvider>
				
				<ZSlotProvider z-name="providerMultiChildInListWithoutDefault">
					<Text>multi child in list without default (1)</Text>
					<Text>multi child in list without default (2)</Text>
					<Text>multi child in list without default (3)</Text>
				</ZSlotProvider>
				
				<ZSlotProvider z-name="withScope" z-scope="myScope">
					<Text>withScope 1: {{ myScope.item1 }}</Text>
					<Text>withScope 2: {{ myScope.item2 }}</Text>
				</ZSlotProvider>
			</TestSlotsHostedWidget>
		</Column>
	""";
}