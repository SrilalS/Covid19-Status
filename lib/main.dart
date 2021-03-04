reare import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fossapp/prev.dart';
import 'package:fossapp/symp.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' ;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Stats - FOSS NSBM',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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

String th = '00';
String tr = '00';
bool pop = true;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    void _popUp() {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: Container(
                  color: Colors.black,
                  height: w / 1.25,
                  width: w / 1.5,
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Please Wash Your Hands before Entering!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Image.asset(
                          'assets/hands.png',
                          scale: 2.5,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RaisedButton(
                            elevation: 4,
                            color: Colors.white,
                            splashColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            child: Text(
                              'Okay',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  )));
        },
      );
    }

    Future<http.Response> fetchData() async {
      final response = await http
          .get('http://hpb.health.gov.lk/api/get-current-statistical');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        tc = data['data']['local_total_cases'].toString();
        td = data['data']['local_deaths'].toString();
        nc = data['data']['local_new_cases'].toString();
        tr = data['data']['local_recovered'].toString();
        up = data['data']['update_date_time'].toString();
        setState(() {
          var a;
          if (pop) {
            pop = false;
            _popUp();
          }
        });
      } else {
        if (pop) {
          pop = false;
          _popUp();
        }
        print('Mars First');
      }
    }

    OneSignal.shared.init("df0e685a-2818-43f7-8ecf-a873b48aa4f3");
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    fetchData();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              fetchData();
              //_popUp();
            });
          }),
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: h / 10),
                  height: h / 5,
                  child: Image.asset('assets/logoW.png'),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'An OpenSource Project by FOSS Community NSBM',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Based on an API Provided by HEALTH PROMOTION BUREAU',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'For More Information :',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: w / 2,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      color: Colors.grey[700],
                      child: Text(
                        'HPB Website',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        const url = 'https://healthpromo.gov.lk/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: w / 2,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      color: Colors.grey[700],
                      child: Text(
                        'View Source on GitHub',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        const url =
                            'https://github.com/SrilalS/Covid19-Status/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('COVID-19 Situation Report'),
              Text(
                up,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            height: h * 0.2,
            width: w * 0.9,
            child: Card(
              color: Colors.grey[850],
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
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  Text(
                    tc,
                    style: TextStyle(
                        color: Colors.white,
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
                  color: Colors.grey[850],
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
                      Icon(
                        Icons.airline_seat_individual_suite,
                        color: Colors.red,
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
                  color: Colors.grey[850],
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
                        style: TextStyle(color: Colors.amber, fontSize: 16),
                      ),
                      Icon(
                        Icons.note_add,
                        color: Colors.amber,
                      ),
                      Text(
                        nc,
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: h * 0.2,
            width: w * 0.9,
            child: Card(
              color: Colors.grey[850],
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
                    'Recovered',
                    style: TextStyle(color: Colors.green, fontSize: 32),
                  ),
                  Text(
                    tr,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 64,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: w * 0.87,
            height: h / 12,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: RaisedButton(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                color: Colors.grey[600],
                child: Text(
                  'Main Symptoms',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sympscr()),
                  );
                }),
          ),
          Container(
            width: w * 0.87,
            height: h / 12,
            margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: RaisedButton(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                color: Colors.grey[600],
                child: Text(
                  'Prevention Methods',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Prevscr()),
                  );
                }),
          )
        ],
      )),
    );
  }
}
