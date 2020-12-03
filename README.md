# RomeBus

<img src="./raw/logo.png" alt="Logo">

A package for handling events,like EventBus in android,can use in dart project or flutter project.

## Architecture

<img src="./raw/architecture.png" alt="architecture">

## Pub

```yaml
dependencies:
  rome_bus: 0.0.1
```

## Usage with 3 step

### 1. Create an Event Object 

```dart

//event object
class CommonEvent {
  final int count;

  CommonEvent(this.count);
}

```

### 2. Register an Event

```dart

String eventRegisterText ='';

 @override
  void initState() {
    super.initState();
    //just control event object
    RomeBus.getBus().register<CommonEvent>((event) {
      setState(() {
        eventRegisterText = 'register event ${event.count}';
      });
    });
  }
```

### 3. Send an Event

```dart

RomeBus.getBus().send(CommonEvent(100));

```

## Using Vip Event

Sometimes you only need to listen to the event once, you can use VipEvent.

see example [vip_page](https://github.com/wei-spring/rome_bus/blob/master/example/lib/page/vip_page.dart) .

License
----

The MIT License (MIT)





