library rome_bus;

import 'package:rome_bus/bus/bus.dart';
import 'package:rome_bus/bus/rome_common_bus.dart';
import 'package:rome_bus/bus/rome_vip_bus.dart';

/// RomeBus,event send & listen.

typedef void EventListen(dynamic event);

class RomeBus {
  static Bus getBus({bool isVip = false}) {
    if (isVip) {
      return RomeVipBus();
    } else {
      return RomeCommonBus();
    }
  }
}
