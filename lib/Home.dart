import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Card(

                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          children:[
                            Text('Total: 99',
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Card(

                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              children:[
                                Text('Total: 99',
                                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Card(

                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              children:[
                                Text('Total: 99',
                                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
