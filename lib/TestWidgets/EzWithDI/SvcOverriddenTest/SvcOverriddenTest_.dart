
import 'package:ezflap/ezflap.dart';

part "SvcOverriddenTest_.g.dart";

@EzService()
class SvcOverriddenTest extends _EzServiceBase {
	static i() => _EzServiceBase.i();

	int getTestValue() {
		return 1919;
	}
}
