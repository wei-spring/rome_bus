import 'package:example/event/event.dart';
import 'package:flutter/material.dart';
import 'package:rome_bus/bus/bus.dart';
import 'package:rome_bus/rome_bus.dart';

Bus newBus = RomeBus.getBus(isVip: true);

class VipPage extends StatefulWidget {
  @override
  _VipPageState createState() => _VipPageState();
}

class _VipPageState extends State<VipPage> {
  int _count = 999;
  String eventRegisterText = '';

  @override
  void dispose() {
    super.dispose();
    newBus.destroy();
    newBus = null;
  }

  @override
  void initState() {
    super.initState();
    if (newBus == null) {
      newBus = RomeBus.getBus(isVip: true);
    }
    newBus.register<VipEvent>((event) {
      setState(() {
        eventRegisterText = 'register vip event ${event.name}';
      });
    });
  }

  void _incrementCounter() {
    _count++;
    newBus.send(VipEvent('vip send data$_count'));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vip Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Test send event from vip event',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('receive count $eventRegisterText '),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Send Msg',
        child: Icon(
          Icons.send,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
