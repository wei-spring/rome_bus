import 'package:example/event/event.dart';
import 'package:flutter/material.dart';
import 'package:rome_bus/rome_bus.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int _count = 999;

  void _incrementCounter() {
    _count++;
    RomeBus.getBus().send(CommonEvent(_count));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Test send event from new page,and listen event in other page(pre page)',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'send count $_count to pre page',
              style: TextStyle(color: Colors.red),
            ),
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
