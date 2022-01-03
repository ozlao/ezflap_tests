
import 'package:ezflap/ezflap.dart';
import 'package:get/get.dart';

import 'OtherReactiveEntity/OtherReactiveEntity.dart';

part "MyReactiveEntity.g.dart";

@EzReactive()
class MyReactiveEntity with _MyReactiveEntityRxMixin {
	@EzValue() late int _$hello1;
	@EzValue() String _$hello2 = "world";
	@EzValue() OtherReactiveEntity _$other = OtherReactiveEntity(888);
	@EzValue() RxList<String> _$arrAnimals = [ "dog", "cat", "tardigrade" ].obs; // --> this.arrAnimals
}