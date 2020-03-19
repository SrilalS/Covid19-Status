import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Stats - FOSS NSBM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FOSS NSBM - COVID-19 Status'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String tc = '00';
String td = '00';
String nc = '00';
String up = "----/--/-- --:--";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    Future<http.Response> fetchData() async {
      final response = await http
          .get('http://hpb.health.gov.lk/api/get-current-statistical');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        tc = data['data']['local_total_cases'].toString();
        td = data['data']['local_deaths'].toString();
        nc = data['data']['local_new_cases'].toString();
        up = data['data']['update_date_time'].toString();
        print(nc);
        print(tc);
        print(td);
      } else {
        print('Error');
      }
    }

    OneSignal.shared.init("df0e685a-2818-43f7-8ecf-a873b48aa4f3");
    setState(() {
      fetchData();
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              fetchData();
            });
          }),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('COVID-19 Situation Report'),
            Text(
              up,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      drawer: Drawer(),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            height: h * 0.2,
            width: w * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              //color: Colors.white60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Total Cases',
                    style: TextStyle(color: Colors.orange, fontSize: 32),
                  ),
                  Text(
                    tc,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 64,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: h * 0.2,
                width: w * 0.45,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4,
                  //color: Colors.grey[900],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Total Deaths',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      Text(
                        td,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: h * 0.2,
                width: w * 0.45,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4,
                  // color: Colors.grey[900],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'New Cases',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      Text(
                        nc,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
