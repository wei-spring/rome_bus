/// abstract bus,event send & listen.

typedef void EventListen(dynamic event);

abstract class Bus {
  Stream<T> apply<T>();

  void register<T>(EventListen l);

  void send(dynamic);

  void destroy();
}
