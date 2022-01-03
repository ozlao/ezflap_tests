
import 'package:ezflap/ezflap.dart';
import 'package:ezflap_tests/TestWidgets/EzWithDI/SvcSubTest/SvcSubTest_.dart';

part "SvcTest_.g.dart";

@EzService()
class SvcTest extends _EzServiceBase {
	static i() => _EzServiceBase.i();

	@EzDI() late SvcSubTest _svcSubTest;

	int getTestValue() {
		return 1717;
	}

	int getSubTestValue() {
		return this._svcSubTest.getTestValue();
	}
}
