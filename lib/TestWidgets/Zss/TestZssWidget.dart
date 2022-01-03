
import 'dart:async';

import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'TestZssWidget.g.dart';

class TestZssWidget extends EzStatefulWidgetBase {
	@override
	EzStateBase createState() => TestZssWidgetState();
}

const String _EXTERNAL_ZSS = """
	<ZSS>
		<RULE SEL="Container.externalZss[type='overrideTest']">
			<child->
				<Text>external zss</Text>
			</child->
		</RULE>

		<RULE SEL="Container.extOverByLocal[type='overrideTest']">
			<child->
				<Text>extOverByLocal ext</Text>
			</child->
		</RULE>

		<RULE SEL="Container.ext3OverByLocal[type='overrideTest']">
			<child->
				<Text>ext3OverByLocal ext</Text>
			</child->
		</RULE>
		<RULE SEL="Container.ext3OverByExt[type='overrideTest']">
			<child->
				<Text>ext3OverByExt ext</Text>
			</child->
		</RULE>

		<RULE SEL="Container.ext2OverByLocal[type='overrideTest']">
			<child->
				<Text>ext2OverByLocal ext</Text>
			</child->
		</RULE>
		<RULE SEL="Container.ext2OverByExt[type='overrideTest']">
			<child->
				<Text>ext2OverByExt ext</Text>
			</child->
		</RULE>

		<RULE SEL="Container.ext1OverByLocal[type='overrideTest']">
			<child->
				<Text>ext1OverByLocal ext</Text>
			</child->
		</RULE>
		<RULE SEL="Container.ext1OverByExt[type='overrideTest']">
			<child->
				<Text>ext1OverByExt ext</Text>
			</child->
		</RULE>
	</ZSS>
""";

const List<String> _EXTERNAL_ZSSES = [
	"""
		<ZSS>
			<RULE SEL="Container.externalZsses3[type='overrideTest']">
				<child->
					<Text>external zss 3</Text>
				</child->
			</RULE>
			
			<RULE SEL="Container.ext3OverByLocal[type='overrideTest']">
				<child->
					<Text>ext3OverByLocal</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt[type='overrideTest']">
				<child->
					<Text>ext3OverByExt</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt1[type='overrideTest']">
				<child->
					<Text>ext3OverByExt1</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt2[type='overrideTest']">
				<child->
					<Text>ext3OverByExt2</Text>
				</child->
			</RULE>
		</ZSS>
	""",
	"""
		<ZSS>
			<RULE SEL="Container.externalZsses2[type='overrideTest']">
				<child->
					<Text>external zss 2</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext2OverByLocal[type='overrideTest']">
				<child->
					<Text>ext2OverByLocal</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext2OverByExt[type='overrideTest']">
				<child->
					<Text>ext2OverByExt</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext2OverByExt1[type='overrideTest']">
				<child->
					<Text>ext2OverByExt1</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext3OverByLocal[type='overrideTest']">
				<child->
					<Text>ext3OverByLocal ext2</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt[type='overrideTest']">
				<child->
					<Text>ext3OverByExt ext2</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt1[type='overrideTest']">
				<child->
					<Text>ext3OverByExt1 ext2</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt2[type='overrideTest']">
				<child->
					<Text>ext3OverByExt2 ext2</Text>
				</child->
			</RULE>
		</ZSS>
	""",
	"""
		<ZSS>
			<RULE SEL="Container.externalZsses1[type='overrideTest']">
				<child->
					<Text>external zss 1</Text>
				</child->
			</RULE>
			
			<RULE SEL="Container.ext1OverByLocal[type='overrideTest']">
				<child->
					<Text>ext1OverByLocal ext1</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext1OverByExt[type='overrideTest']">
				<child->
					<Text>ext1OverByExt ext1</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext3OverByLocal[type='overrideTest']">
				<child->
					<Text>ext3OverByLocal ext1</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt[type='overrideTest']">
				<child->
					<Text>ext3OverByExt ext1</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext3OverByExt1[type='overrideTest']">
				<child->
					<Text>ext3OverByExt1 ext1</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext2OverByLocal[type='overrideTest']">
				<child->
					<Text>ext2OverByLocal ext1</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext2OverByExt[type='overrideTest']">
				<child->
					<Text>ext2OverByExt ext1</Text>
				</child->
			</RULE>
			<RULE SEL="Container.ext2OverByExt1[type='overrideTest']">
				<child->
					<Text>ext2OverByExt1 ext1</Text>
				</child->
			</RULE>
		</ZSS>
	""",
];


@EzWidget(zss: _EXTERNAL_ZSS, zsses: _EXTERNAL_ZSSES)
class TestZssWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Container><Text>fixed text</Text></Container>
			<Container type="yesNo" z-attr:class="setOnOddSeconds"></Container>
			<Container type="yesNo" z-attr:show="onOddSeconds"></Container>
			<Container type="color" z-attr:color="redColor"></Container>
			<Container type="color" z-attr:color="greenColor"></Container>
			
			<Container type="separateFile" class="anInternal1" />
			<Container type="separateFile" class="anInternal2" />
			<Container type="separateFile" class="global" />

			<Container type="overrideTest" class="localZss" />
			<Container type="overrideTest" class="externalZss" />
			<Container type="overrideTest" class="externalZsses1" />
			<Container type="overrideTest" class="externalZsses2" />
			<Container type="overrideTest" class="externalZsses3" />

			<Container type="overrideTest" class="extOverByLocal" /> <!-- aaa -->
			<Container type="overrideTest" class="ext1OverByLocal" />
			<Container type="overrideTest" class="ext1OverByExt" />
			<Container type="overrideTest" class="ext2OverByLocal" />
			<Container type="overrideTest" class="ext2OverByExt" />
			<Container type="overrideTest" class="ext2OverByExt1" />
			<Container type="overrideTest" class="ext3OverByLocal" />
			<Container type="overrideTest" class="ext3OverByExt" />
			<Container type="overrideTest" class="ext3OverByExt1" />
			<Container type="overrideTest" class="ext3OverByExt2" />
		</Column>
	""";


	/* ZSS (9) **/
	static const String _ZSS = """
		<ZSS>
			<RULE SEL="Text.red[applyZss=yes]">
				<style->
					<TextStyle z-bind:color="Colors.red" z-bind:fontSize="18" />
				</style->
			</RULE>
			<RULE SEL="Container.localZss">
				<child->
					<Text>local zss</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext3OverByLocal[type='overrideTest']">
				<child->
					<Text>ext3OverByLocal local</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext2OverByLocal[type='overrideTest']">
				<child->
					<Text>ext2OverByLocal local</Text>
				</child->
			</RULE>

			<RULE SEL="Container.ext1OverByLocal[type='overrideTest']">
				<child->
					<Text>ext1OverByLocal local</Text>
				</child->
			</RULE>

			<RULE SEL="Container.extOverByLocal[type='overrideTest']">
				<child->
					<Text>extOverByLocal local</Text>
				</child->
			</RULE>

			<RULE SEL="Container.yes[type='yesNo']">
				<child->
					<Text>show by class</Text>
				</child->
			</RULE>

			<RULE SEL="Container[show='yes'][type='yesNo']">
				<child->
					<Text>show by attr</Text>
				</child->
			</RULE>

			<RULE SEL="Container[type='color'][color=Colors.red]">
				<child->
					<Text>found red color</Text>
				</child->
			</RULE>
		</ZSS>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("setOnOddSeconds") Set<String> _$setOnOddSeconds = { };
	@EzField("onOddSeconds") String _$onOddSeconds = "";


	/* PRIVATE VARIABLES (12) **/
	bool _isOdd = false;


	/* COMPUTED PROPERTIES (14) **/
	@EzComputed("redColor")
	Color _computedRedColor() {
		return Colors.red;
	}

	@EzComputed("greenColor")
	Color _computedGreenColor() {
		return Colors.green;
	}


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this.onDispose(Tick.periodic(1000, () {
			this._isOdd = !this._isOdd;

			if (this._isOdd) {
				this._setOnOddSeconds = { "yes" };
				this._onOddSeconds = "yes";
			}
			else {
				this._setOnOddSeconds = { "no" };
				this._onOddSeconds = "no";
			}
		}));
	}
}
