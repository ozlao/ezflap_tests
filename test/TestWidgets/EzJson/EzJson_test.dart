// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ezflap_tests/TestWidgets/EzJson/JClass1.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
	testWidgets("EzJson tests", (WidgetTester tester) async {
		String json = """
			{
				"lateString": "late string"
				,"nullableString": "nullable string"
				
				,"aString": "a string"
				,"anInt": 42
				,"aDouble": 42.42
				,"aNum": 88.88
				,"aBool": true
				,"aDynamic": "a dynamic"
				
				,"aListOfSomethings": [ 42, "hello" ]
				,"aListOfInts": [ 42, 17, 88 ]
				,"aSetOfInts": [ 142, 117, 188 ]
				,"aMapOfInts": { "int1": 242, "int2": 217, "int3": 288 }
				,"aMapOfListsOfInts": {
					"arr1": [ 342, 317, 388 ],
					"arr2": [ 442, 417, 488 ],
					"arr3": [ 542, 517, 588 ]
				}

				,"aListOfSomethingsRx": [ 43, "hello!" ]
				,"aListOfIntsRx": [ 43, 18, 89 ]
				,"aSetOfIntsRx": [ 143, 118, 189 ]
				,"aMapOfIntsRx": { "int1": 243, "int2": 218, "int3": 289 }
				,"aMapOfListsOfIntsRx": {
					"arr1": [ 343, 318, 389 ],
					"arr2": [ 443, 418, 489 ],
					"arr3": [ 543, 518, 589 ]
				}
				
				,"aLateClass": { "anInt": 42 }
				,"aClass": { "anInt": 17 }
				
				,"aListOfClasses": [
					{ "anInt": 17 }
					,{ "anInt": 42 }
					,{ "anInt": 88 }
				]
				,"aSetOfClasses": [
					{ "anInt": 117 }
					,{ "anInt": 142 }
					,{ "anInt": 188 }
				]
				,"aMapOfClasses": {
					"cls1": { "anInt": 217 }
					,"cls2": { "anInt": 242 }
					,"cls3": { "anInt": 288 }
				}

				,"aListOfClassesRx": [
					{ "anInt": 18 }
					,{ "anInt": 43 }
					,{ "anInt": 89 }
				]
				,"aSetOfClassesRx": [
					{ "anInt": 118 }
					,{ "anInt": 143 }
					,{ "anInt": 189 }
				]
				,"aMapOfClassesRx": {
					"cls1": { "anInt": 218 }
					,"cls2": { "anInt": 243 }
					,"cls3": { "anInt": 289 }
				}
				
				,"aComplexMap": {
					"itemA1": [
						[
							{
								"itemB1": {
									"itemC1": {
										"itemD1": {
											"itemE1": 42,
											"itemE2": 17,
											"itemE3": 88
										}
										,"itemD2": {
											"itemE1": 142,
											"itemE2": 117,
											"itemE3": 188
										}
									}
									,"itemC2": {
										"itemD1": {
											"itemE1": 242,
											"itemE2": 217,
											"itemE3": 288
										}
										,"itemD2": {
											"itemE1": 342,
											"itemE2": 317,
											"itemE3": 388
										}
									}
								}
							}
						]
					]
					,"itemA2": [
						[
							{
								"itemB1": {
									"itemC1": {
										"itemD1": {
											"itemE1": 442,
											"itemE2": 417,
											"itemE3": 488
										}
										,"itemD2": {
											"itemE1": 542,
											"itemE2": 517,
											"itemE3": 588
										}
									}
									,"itemC2": {
										"itemD1": {
											"itemE1": 642,
											"itemE2": 617,
											"itemE3": 688
										}
										,"itemD2": {
											"itemE1": 742,
											"itemE2": 717,
											"itemE3": 788
										}
									}
								}
							}
						]
					]
				}
			}
		""";

		JClass1 cls = JClass1.factoryFromJson(json);
		_testEntireClass(cls);

		String json2 = cls.toJson();
		JClass1 cls2 = JClass1.factoryFromJson(json2);
		_testEntireClass(cls2);

		String json3 = cls2.toJson();
		expect(json2, json3);
	});
}

void _testEntireClass(JClass1 cls) {
	expect(cls.lateString, "late string");
	expect(cls.nullString, null);
	expect(cls.nullableString, "nullable string");

	expect(cls.aString, "a string");
	expect(cls.anInt, 42);
	expect(cls.aDouble, 42.42);
	expect(cls.aNum, 88.88);
	expect(cls.aBool, true);
	expect(cls.aDynamic, "a dynamic");


	_expectListOrSet(cls.aListOfSomethings, [ 42, "hello" ]);
	_expectListOrSet(cls.aListOfInts, [ 42, 17, 88 ]);
	_expectListOrSet(cls.aSetOfInts, [ 142, 117, 188 ]);

	_testMap(cls.aMapOfInts, {
		"int1": (x) => expect(x, 242),
		"int2": (x) => expect(x, 217),
		"int3": (x) => expect(x, 288),
	});

	_testMap(cls.aMapOfListsOfInts, {
		"arr1": (x) => _expectListOrSet(x, [ 342, 317, 388 ]),
		"arr2": (x) => _expectListOrSet(x, [ 442, 417, 488 ]),
		"arr3": (x) => _expectListOrSet(x, [ 542, 517, 588 ]),
	});


	_expectListOrSet(cls.aListOfSomethingsRx, [ 43, "hello!" ]);
	_expectListOrSet(cls.aListOfIntsRx, [ 43, 18, 89 ]);
	_expectListOrSet(cls.aSetOfIntsRx, [ 143, 118, 189 ]);

	_testMap(cls.aMapOfIntsRx, {
		"int1": (x) => expect(x, 243),
		"int2": (x) => expect(x, 218),
		"int3": (x) => expect(x, 289),
	});

	_testMap(cls.aMapOfListsOfIntsRx, {
		"arr1": (x) => _expectListOrSet(x, [ 343, 318, 389 ]),
		"arr2": (x) => _expectListOrSet(x, [ 443, 418, 489 ]),
		"arr3": (x) => _expectListOrSet(x, [ 543, 518, 589 ]),
	});

	expect(cls.aLateClass.anInt, 42);
    expect(cls.aClass?.anInt, 17);

	_testListOrSet(cls.aListOfClasses, [
		(x) => expect(x.anInt, 17),
		(x) => expect(x.anInt, 42),
		(x) => expect(x.anInt, 88),
	]);
	_testListOrSet(cls.aSetOfClasses, [
		(x) => expect(x.anInt, 117),
		(x) => expect(x.anInt, 142),
		(x) => expect(x.anInt, 188),
	]);
	_testMap(cls.aMapOfClasses, {
		"cls1": (x) => expect(x.anInt, 217),
		"cls2": (x) => expect(x.anInt, 242),
		"cls3": (x) => expect(x.anInt, 288),
	});

	_testListOrSet(cls.aListOfClassesRx, [
		(x) => expect(x.anInt, 18),
		(x) => expect(x.anInt, 43),
		(x) => expect(x.anInt, 89),
	]);
	_testListOrSet(cls.aSetOfClassesRx, [
		(x) => expect(x.anInt, 118),
		(x) => expect(x.anInt, 143),
		(x) => expect(x.anInt, 189),
	]);
	_testMap(cls.aMapOfClassesRx, {
		"cls1": (x) => expect(x.anInt, 218),
		"cls2": (x) => expect(x.anInt, 243),
		"cls3": (x) => expect(x.anInt, 289),
	});

	_testMap(cls.aComplexMap, {
		"itemA1": (x) => _testListOrSet(x, [
			(x) => _testListOrSet(x, [
				(x) => _testMap(x, {
					"itemB1": (x) => _testMap(x, {
						"itemC1": (x) => _testMap(x, {
							"itemD1": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 42),
								"itemE2": (x) => expect(x, 17),
								"itemE3": (x) => expect(x, 88),
							}),
							"itemD2": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 142),
								"itemE2": (x) => expect(x, 117),
								"itemE3": (x) => expect(x, 188),
							}),
						}),
						"itemC2": (x) => _testMap(x, {
							"itemD1": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 242),
								"itemE2": (x) => expect(x, 217),
								"itemE3": (x) => expect(x, 288),
							}),
							"itemD2": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 342),
								"itemE2": (x) => expect(x, 317),
								"itemE3": (x) => expect(x, 388),
							}),
						}),
					}),
				}),
			]),
		]),
		"itemA2": (x) => _testListOrSet(x, [
			(x) => _testListOrSet(x, [
				(x) => _testMap(x, {
					"itemB1": (x) => _testMap(x, {
						"itemC1": (x) => _testMap(x, {
							"itemD1": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 442),
								"itemE2": (x) => expect(x, 417),
								"itemE3": (x) => expect(x, 488),
							}),
							"itemD2": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 542),
								"itemE2": (x) => expect(x, 517),
								"itemE3": (x) => expect(x, 588),
							}),
						}),
						"itemC2": (x) => _testMap(x, {
							"itemD1": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 642),
								"itemE2": (x) => expect(x, 617),
								"itemE3": (x) => expect(x, 688),
							}),
							"itemD2": (x) => _testMap(x, {
								"itemE1": (x) => expect(x, 742),
								"itemE2": (x) => expect(x, 717),
								"itemE3": (x) => expect(x, 788),
							}),
						}),
					}),
				}),
			]),
		]),
	});
}

void _expectListOrSet(Iterable? iterActual, List arrExpected) {
	expect(iterActual != null, true);
	List arrActual = iterActual!.toList();
	expect(arrActual.length, arrExpected.length);
	for (int i = 0; i < arrActual.length; i++) {
		expect(arrActual[i], arrExpected[i]);
	}
}

void _testListOrSet(Iterable? iterActual, List<Function(dynamic value)> arrFuncTestValues) {
	expect(iterActual != null, true);
	List arrActual = iterActual!.toList();
	expect(arrActual.length, arrFuncTestValues.length);
	for (int i = 0; i < arrActual.length; i++) {
		arrFuncTestValues[i](arrActual[i]);
	}
}

void _testMap(Map<String, dynamic>? mapActual, Map<String, Function(dynamic value)> mapFuncTestValues) {
	expect(mapActual != null, true);
	expect(mapActual!.length, mapFuncTestValues.length);
	_expectListOrSet(mapActual.keys, mapFuncTestValues.keys.toList());
	for (String key in mapActual.keys) {
		mapFuncTestValues[key]!(mapActual[key]);
	}
}
