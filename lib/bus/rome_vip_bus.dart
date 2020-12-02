//RomeBus
import 'package:rome_bus/bus/bus.dart';
import 'package:rome_bus/stream/vip_bus.dart';

/// RomeVipBus,event send & listen.with only  one listen.

class RomeVipBus extends Bus {
  RomeVipBus() {
    _vipBus = VipBus();
  }

  VipBus _vipBus;
  bool isVipListen = false;

  ///listens for  events of Type [T] and its subtypes
  Stream<T> apply<T>() {
    if (T == dynamic) {
      return _vipBus.streamControllerVip.stream;
    } else {
      return _vipBus.streamControllerVip.stream
          .where((event) => event is T)
          .cast<T>();
    }
  }

  ///listens for  events of Type [T] and its subtypes
  void register<T>(EventListen listen) {
    if (T == dynamic) {
      _vipBus.streamControllerVip.stream.listen((event) {
        listen(event);
      });
    } else {
      if (!isVipListen) {
        isVipListen = true;
        _vipBus.streamControllerVip.stream.listen((event) {
          listen(event);
        });
      } else {
        print(
            'RomeBus: VipBus Stream has already been listened to，Please use common bus.');
      }
    }
  }

  ///send a event
  @override
  void send(event) {
    _vipBus.send(event);
  }

  ///destroy this RomeBus.Do Not Use Apart From Exit APP.
  @override
  void destroy() {
    _vipBus.destroy();
  }
}
