
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

part 'TestZForWidget.g.dart';

class TestZForWidget extends EzStatefulWidgetBase {
	TestZForWidget({ Key? key }) : super(key: key);

	@override
	TestZForWidgetState createState() => TestZForWidgetState();
}

@EzWidget()
class TestZForWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<SingleChildScrollView>
			<Column>
				<Text>text 1</Text>

				<Text z-for="v in arrTexts">for1: {{ v }}</Text>
				<Text z-for="(v, idx) in arrTexts">for2: idx={{ idx }}, v={{ v }}</Text>
				<Text z-for="v in arrTexts" z-if="cnt % 2 == 1">for3 (odd): v={{ v }}</Text>
				<Text z-for="v in arrTexts" z-show="cnt % 2 == 0">for4 (even): v={{ v }}</Text>
				<Text z-for="v in arrTexts" z-if="cnt > 10" z-show="cnt % 2 == 0">for5 (even, > 10): v={{ v }}</Text>

				<Text z-for="v in setTexts">forSet1: {{ v }}</Text>
				<Text z-for="(v, idx) in setTexts">forSet2: idx={{ idx }}, v={{ v }}</Text>
				<Text z-for="v in setTexts" z-if="cnt % 2 == 1">forSet3 (odd): v={{ v }}</Text>
				<Text z-for="v in setTexts" z-show="cnt % 2 == 0">forSet4 (even): v={{ v }}</Text>
				<Text z-for="v in setTexts" z-if="cnt > 10" z-show="cnt % 2 == 0">forSet5 (even, > 10): v={{ v }}</Text>
				
				<Text z-for="v in mapTexts">map1: {{ v }}</Text>
				<Text z-for="(v, idx) in mapTexts">map2: idx={{ idx }}, v={{ v }}</Text>
				<Text z-for="v in mapTexts" z-if="cnt % 2 == 1">map3 (odd): v={{ v }}</Text>
				<Text z-for="v in mapTexts" z-show="cnt % 2 == 0">map4 (even): v={{ v }}</Text>
				<Text z-for="v in mapTexts" z-if="cnt > 10" z-show="cnt % 2 == 0">map5 (even, > 10): v={{ v }}</Text>
				
				<Column>
					<Column z-for="v1 in arrColumns">
						<Text z-for="v2 in arrTexts">s1v1: {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
					
					<Column z-for="v1 in arrColumns" z-if="cnt % 2 == 1">
						<Text z-for="v2 in arrTexts" z-if="cnt % 2 == 1">s2v1 (odd): {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
					
					<Column z-for="v1 in arrColumns" z-if="cnt % 2 == 0">
						<Text z-for="v2 in arrTexts" z-if="cnt % 2 == 0">s2v1 (even): {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
					
					<Column z-for="v1 in arrColumns" z-if="cnt % 2 == 1">
						<Text z-for="v2 in arrTexts" z-if="cnt % 2 == 1" z-show="cnt > 10">s3v1 (odd, > 10): {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
				</Column>

				<Text z-for="(v, key, idx) in mapTexts">map6: idx={{ idx }}, key={{ key }}, v={{ v }}</Text>





				<Text z-for="v in rxArrTexts">rxFor1: {{ v }}</Text>
				<Text z-for="(v, idx) in rxArrTexts">rxFor2: idx={{ idx }}, v={{ v }}</Text>
				<Text z-for="v in rxArrTexts" z-if="cnt % 2 == 1">rxFor3 (odd): v={{ v }}</Text>
				<Text z-for="v in rxArrTexts" z-show="cnt % 2 == 0">rxFor4 (even): v={{ v }}</Text>
				<Text z-for="v in rxArrTexts" z-if="cnt > 10" z-show="cnt % 2 == 0">rxFor5 (even, > 10): v={{ v }}</Text>

				<Text z-for="v in rxSetTexts">rxForSet1: {{ v }}</Text>
				<Text z-for="(v, idx) in rxSetTexts">rxForSet2: idx={{ idx }}, v={{ v }}</Text>
				<Text z-for="v in rxSetTexts" z-if="cnt % 2 == 1">rxForSet3 (odd): v={{ v }}</Text>
				<Text z-for="v in rxSetTexts" z-show="cnt % 2 == 0">rxForSet4 (even): v={{ v }}</Text>
				<Text z-for="v in rxSetTexts" z-if="cnt > 10" z-show="cnt % 2 == 0">rxForSet5 (even, > 10): v={{ v }}</Text>
				
				<Text z-for="v in rxMapTexts">rxMap1: {{ v }}</Text>
				<Text z-for="(v, idx) in rxMapTexts">rxMap2: idx={{ idx }}, v={{ v }}</Text>
				<Text z-for="v in rxMapTexts" z-if="cnt % 2 == 1">rxMap3 (odd): v={{ v }}</Text>
				<Text z-for="v in rxMapTexts" z-show="cnt % 2 == 0">rxMap4 (even): v={{ v }}</Text>
				<Text z-for="v in rxMapTexts" z-if="cnt > 10" z-show="cnt % 2 == 0">rxMap5 (even, > 10): v={{ v }}</Text>
				
				<Column>
					<Column z-for="v1 in arrColumns">
						<Text z-for="v2 in rxArrTexts">rxS1v1: {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
					
					<Column z-for="v1 in arrColumns" z-if="cnt % 2 == 1">
						<Text z-for="v2 in rxArrTexts" z-if="cnt % 2 == 1">rxS2v1 (odd): {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
					
					<Column z-for="v1 in arrColumns" z-if="cnt % 2 == 0">
						<Text z-for="v2 in rxArrTexts" z-if="cnt % 2 == 0">rxS2v1 (even): {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
					
					<Column z-for="v1 in arrColumns" z-if="cnt % 2 == 1">
						<Text z-for="v2 in rxArrTexts" z-if="cnt % 2 == 1" z-show="cnt > 10">rxS3v1 (odd, > 10): {{ v1 }} - v2: {{ v2 }}</Text>
					</Column>
				</Column>

				<Text z-for="(v2, key2, idx2) in rxMapTexts">rxMap6: idx={{ idx2 }}, key={{ key2 }}, v={{ v2 }}</Text>
			</Column>
		</SingleChildScrollView>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("cnt") int _$cnt = 0;
	@EzField("arrColumns") late List<String> _$arrColumns = [ "C1", "C2", "C3" ];

	@EzField("arrTexts") late List<String> _$arrTexts = [ "T1", "T2", "T3" ];
	@EzField("rxArrTexts") late List<String> _$rxArrTexts = [ "T1", "T2", "T3" ];

	@EzField("setTexts") late Set<String> _$setTexts = { "T1", "T2", "T3" };
	@EzField("rxSetTexts") late RxSet<String> _$rxSetTexts = { "T1", "T2", "T3" }.obs;

	@EzField("mapTexts") late Map<String, String> _$mapTexts = { "K1": "V1", "K2": "V2", "K3": "V3" };
	@EzField("rxMapTexts") late RxMap<String, String> _$rxMapTexts = { "K1": "V1", "K2": "V2", "K3": "V3" }.obs;


	/* LIFECYCLE (20) **/
	@override
	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () => this._cnt++));
	}
}