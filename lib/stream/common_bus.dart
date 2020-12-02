// common means the event will send with common style,with broadcast and sync
// stream can listen more than one times

// @CommonBus

import 'dart:async';

class CommonBus {
  StreamController _streamControllerCommon;

  StreamController get streamControllerCommon => _streamControllerCommon;

  CommonBus({bool sync = false})
      : _streamControllerCommon = StreamController.broadcast(sync: sync);

  ///listens for common events of Type [T] and its subtypes
  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamControllerCommon.stream;
    } else {
      return _streamControllerCommon.stream
          .where((event) => event is T)
          .cast<T>();
    }
  }

  ///send a common event
  void send(event) {
    _streamControllerCommon.add(event);
  }

  ///destroy this CommonBus.
  void destroy() {
    _streamControllerCommon.close();
  }
}
