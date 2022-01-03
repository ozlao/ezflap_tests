
import 'dart:convert';

import 'package:ezflap/ezflap.dart';
import 'package:get/get.dart';

import 'JClass2.dart';

part "JClass1.g.dart";

@EzJson()
class JClass1 extends _JClass1Base {
	static JClass1 factoryFromJson(String json) => _JClass1Base.factoryFromJson(json);
	static JClass1 factoryFromJsonMap(Map<String, dynamic> map) => _JClass1Base.factoryFromJsonMap(map);

	@EzValue() late String lateString;
	@EzValue() String? nullString;
	@EzValue() String? nullableString;

	@EzValue() String? aString;
	@EzValue() int? anInt;
	@EzValue() double? aDouble;
	@EzValue() num? aNum;
	@EzValue() bool? aBool;
	@EzValue() dynamic aDynamic;

	@EzValue() List? aListOfSomethings;
	@EzValue() List<int>? aListOfInts;
	@EzValue() Set<int>? aSetOfInts;
	@EzValue() Map<String, int>? aMapOfInts;
	@EzValue() Map<String, List<int>>? aMapOfListsOfInts;

	@EzValue() RxList? aListOfSomethingsRx;
	@EzValue() RxList<int>? aListOfIntsRx;
	@EzValue() RxSet<int>? aSetOfIntsRx;
	@EzValue() RxMap<String, int>? aMapOfIntsRx;
	@EzValue() RxMap<String, List<int>>? aMapOfListsOfIntsRx;

	@EzValue() late JClass2 _$aLateClass;
	@EzValue() JClass2? _$aClass;
	@EzValue() List<JClass2>? aListOfClasses;
	@EzValue() Set<JClass2>? aSetOfClasses;
	@EzValue() Map<String, JClass2>? aMapOfClasses;

	@EzValue() RxList<JClass2>? _$aListOfClassesRx;
	@EzValue() RxSet<JClass2>? _$aSetOfClassesRx;
	@EzValue() RxMap<String, JClass2>? aMapOfClassesRx;

	@EzValue() Map<String, Set<List<Map<String, Map<String, Map<String, Map<String, int>>>>>>>? aComplexMap;
}
