
import 'package:ezflap/ezflap.dart';

part "OtherReactiveEntity.g.dart";

@EzReactive()
class OtherReactiveEntity with _OtherReactiveEntityRxMixin {
	@EzValue() late int _$wow;

	OtherReactiveEntity(int wow) {
		this.wow = wow;
	}
}
