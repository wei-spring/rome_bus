// vip means the event will send right away,not broadcast and not sync
// and stream can only listen once time!!!.
// not recommend,unless have to.

// @VipBus

import 'dart:async';

class VipBus {
  StreamController<dynamic> _streamControllerVip;

  StreamController get streamControllerVip => _streamControllerVip;

  VipBus() : _streamControllerVip = StreamController<dynamic>();

  ///listens for vip events of Type [T] and its subtypes
  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamControllerVip.stream;
    } else {
      return _streamControllerVip.stream.where((event) => event is T).cast<T>();
    }
  }

  ///send a vip event
  void send(event) {
    _streamControllerVip.add(event);
  }

  ///destroy this VipBus.
  void destroy() {
    _streamControllerVip.close();
  }
}
