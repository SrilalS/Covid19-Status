import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    OneSignal.shared.init("df0e685a-2818-43f7-8ecf-a873b48aa4f3");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Card(
                elevation: 8.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(32),
                      child: Image.asset('assets/logo.png',height: 128, width: 128,),
                    )
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
