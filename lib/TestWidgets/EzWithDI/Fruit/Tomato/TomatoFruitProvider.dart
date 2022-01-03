
import 'package:ezflap/ezflap.dart';

import '../FruitProviderBase.dart';

part "TomatoFruitProvider.g.dart";

@EzService(FruitProviderBase)
class TomatoFruitProvider extends _EzServiceBase {
	static i() => _EzServiceBase.i();

	@override
	String getFruitName() {
		return "Tomato";
	}
}