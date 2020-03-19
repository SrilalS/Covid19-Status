import 'package:flutter/material.dart';

class Sympscr extends StatefulWidget {
  Sympscr({Key key}) : super(key: key);

  @override
  _SympscrState createState() => _SympscrState();
}

class _SympscrState extends State<Sympscr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Main Symptoms'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:8),
                        Image.asset(
                          'assets/1.png',
                          scale: 1,
                        ),
                        Text(
                          'Fever',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:8)
                      ],
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:8),
                        Image.asset(
                          'assets/2.png',
                          scale: 1,
                        ),
                        Text(
                          'Cough',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:8),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:8),
                        Image.asset(
                          'assets/3.png',
                          scale: 1,
                        ),
                        Text(
                          'Sore throat',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:8),
                      ],
                    ),
                  ),
                ),


                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:8),
                        Image.asset(
                          'assets/4.png',
                          scale: 1,
                        ),
                        Text(
                          'Sneezing and runny nose',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:8),
                      ],
                    ),
                  ),
                ),


                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:8),
                        Image.asset(
                          'assets/9.png',
                          scale: 1,
                        ),
                        Text(
                          'Difficulty in breathing',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:8),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
