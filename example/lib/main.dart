import 'package:example/event/event.dart';
import 'package:example/non_page/worker.dart';
import 'package:example/page/new_page.dart';
import 'package:example/page/vip_page.dart';
import 'package:flutter/material.dart';
import 'package:rome_bus/rome_bus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rome Bus Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'RomeBus Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String eventApplyText = '';
  String eventRegisterText = '';
  String eventWorkerText = '';

  @override
  void initState() {
    super.initState();
    //can control stream
    RomeBus.getBus().apply<CommonEvent>().listen((event) {
      setState(() {
        eventApplyText = 'apply event ${event.count}';
      });
    });

    //just control event object
    RomeBus.getBus().register<CommonEvent>((event) {
      setState(() {
        eventRegisterText = 'register event ${event.count}';
      });
    });

    // receive non page event object
    RomeBus.getBus().register<CommonNotPageEvent>((event) {
      setState(() {
        eventWorkerText = 'from non page event ${event.name}';
      });
    });
  }

  void _incrementCounter() {
    RomeBus.getBus().send(CommonEvent(_counter++));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.greenAccent,
              onPressed: () {
                _incrementCounter();
              },
              child: Text(
                "Test Common Event",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.greenAccent,
              onPressed: () {
                Worker w = Worker();
                w.updateInfo();
              },
              child: Text(
                "Test Non Page",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Receive Msg $eventApplyText',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Receive Msg $eventRegisterText',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Receive non page Msg $eventWorkerText',
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.greenAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPage()),
                );
              },
              child: Text(
                "Open New Page",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.greenAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VipPage()),
                );
              },
              child: Text(
                "Open Vip Page",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Send Msg',
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }
}
