
import 'package:ezflap/ezflap.dart';

import '../FruitProviderBase.dart';

part "CherryFruitProvider.g.dart";

@EzService(FruitProviderBase)
class CherryFruitProvider extends _EzServiceBase {
	static i() => _EzServiceBase.i();

	@override
	String getFruitName() {
		return "Cherry";
	}
}