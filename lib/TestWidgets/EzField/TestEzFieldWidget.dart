
import 'package:ezflap/ezflap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part "TestEzFieldWidget.g.dart";

class TestEzFieldWidget extends EzStatefulWidgetBase {
	TestEzFieldWidget({ Key? key }) : super(key: key);

	@override
	TestEzFieldWidgetState createState() => TestEzFieldWidgetState();
}

class MyClass {
	int hello = 42;
}

@EzWidget()
class TestEzFieldWidgetState extends _EzStateBase {
	/* ZML (8) **/
	static const String _ZML = """
		<Column>
			<Text>Elapsed seconds: {{ seconds }}</Text>
			<Text>late int: {{ lateInt }}</Text>
			<Text>late double: {{ lateDouble }}</Text>
			<Text>late bool: {{ lateBool }}</Text>
			<Text>late String: {{ lateString }}</Text>
			<Text>null int: {{ nullInt }}</Text>
			<Text>null double: {{ nullDouble }}</Text>
			<Text>null bool: {{ nullBool }}</Text>
			<Text>null String: {{ nullString }}</Text>
			<Text>nonNull int: {{ nonNullInt }}</Text>
			<Text>nonNull double: {{ nonNullDouble }}</Text>
			<Text>nonNull bool: {{ nonNullBool }}</Text>
			<Text>nonNull String: {{ nonNullString }}</Text>
			<Text>default int: {{ defaultInt }}</Text>
			<Text>default double: {{ defaultDouble }}</Text>
			<Text>default bool: {{ defaultBool }}</Text>
			<Text>default String: {{ defaultString }}</Text>
			<Text>custom-named int: {{ customInt }}</Text>
			<Text>custom-named double: {{ customDouble }}</Text>
			<Text>custom-named bool: {{ customBool }}</Text>
			<Text>custom-named String: {{ customString }}</Text>
			<Text>myClassVar: {{ myClassVar.hello }}</Text>
		</Column>
	""";


	/* BOUND FIELDS (11) **/
	@EzField("seconds") late int _$seconds;
	@EzField("lateInt") late int _$lateInt;
	@EzField("lateDouble") late double _$lateDouble;
	@EzField("lateBool") late bool _$lateBool;
	@EzField("lateString") late String _$lateString;
	@EzField("nullInt") int? _$nullInt;
	@EzField("nullDouble") double? _$nullDouble;
	@EzField("nullBool") bool? _$nullBool;
	@EzField("nullString") String? _$nullString;
	@EzField("nonNullInt") int? _$nonNullInt;
	@EzField("nonNullDouble") double? _$nonNullDouble;
	@EzField("nonNullBool") bool? _$nonNullBool;
	@EzField("nonNullString") String? _$nonNullString;
	@EzField("defaultInt") int _$defaultInt = 88;
	@EzField("defaultDouble") double _$defaultDouble = 88.88;
	@EzField("defaultBool") bool _$defaultBool = true;
	@EzField("defaultString") String _$defaultString = "a default string";
	@EzField("customInt") late int _$customSoVarNameIsDifferentInt;
	@EzField("customDouble") late double _$customSoVarNameIsDifferentDouble;
	@EzField("customBool") late bool _$customSoVarNameIsDifferentBool;
	@EzField("customString") late String _$customSoVarNameIsDifferentString;
	@EzField("myClassVar") late MyClass _$myClassVar;


	/* LIFECYCLE (20) **/
	@override
	void hookInitState() {
		this._seconds = 1;

		this._lateInt = 42;
		this._lateDouble = 42.42;
		this._lateBool = false;
		this._lateString = "late string";

		this._nonNullInt = 69;
		this._nonNullDouble = 69.69;
		this._nonNullBool = true;
		this._nonNullString = "non-null string";

		this._customSoVarNameIsDifferentInt = 9;
		this._customSoVarNameIsDifferentDouble = 9.9;
		this._customSoVarNameIsDifferentBool = false;
		this._customSoVarNameIsDifferentString = "custom string";

		this._myClassVar = MyClass();
	}

	Future<void> hookReady() async {
		this.onDispose(Tick.periodic(1000, () {
			this._seconds++;
		}));
	}
}