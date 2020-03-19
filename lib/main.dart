import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';



void main() => runApp(MyApp(
));

class MyApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'FOSS NSBM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FOSS NSBM App'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    OneSignal.shared.init("df0e685a-2818-43f7-8ecf-a873b48aa4f3");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello!',
              style: TextStyle(fontSize:32),
            ),
            
          ],
        ),
      ),
    );
  }
}
