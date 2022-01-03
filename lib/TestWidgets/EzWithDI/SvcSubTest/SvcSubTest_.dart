
import 'package:ezflap/ezflap.dart';

part "SvcSubTest_.g.dart";

@EzService()
class SvcSubTest extends _EzServiceBase {
	static i() => _EzServiceBase.i();

	int getTestValue() {
		return 1818;
	}
}
