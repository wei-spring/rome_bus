import 'dart:math';

import 'package:example/event/event.dart';
import 'package:rome_bus/rome_bus.dart';

class Worker {
  void updateInfo() {
    RomeBus.getBus().send(CommonNotPageEvent('worker${Random().nextInt(999)}'));
  }
}
