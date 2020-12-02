//RomeBus
import 'package:rome_bus/bus/bus.dart';
import 'package:rome_bus/stream/common_bus.dart';

/// RomeCommonBus,event send & listen,with more than one listen.

class RomeCommonBus extends Bus {
  static final RomeCommonBus _bus = RomeCommonBus._internal();

  factory RomeCommonBus() {
    return _bus;
  }

  RomeCommonBus._internal() {
    _commonBus = CommonBus();
  }

  CommonBus _commonBus;

  ///listens for  events of Type [T] and its subtypes
  @override
  Stream<T> apply<T>() {
    if (T == dynamic) {
      return _commonBus.streamControllerCommon.stream;
    } else {
      return _commonBus.streamControllerCommon.stream
          .where((event) => event is T)
          .cast<T>();
    }
  }

  ///listens for  events of Type [T] and its subtypes
  @override
  void register<T>(EventListen listen) {
    if (T == dynamic) {
      _commonBus.streamControllerCommon.stream.listen((event) {
        listen(event);
      });
    } else {
      _commonBus.streamControllerCommon.stream
          .where((event) => event is T)
          .cast<T>()
          .listen((event) {
        listen(event);
      });
    }
  }

  ///send a event
  @override
  void send(event) {
    _commonBus.send(event);
  }

  ///destroy this RomeBus.Do Not Use Apart From Exit APP.
  @override
  void destroy() {
    _commonBus.destroy();
  }
}
