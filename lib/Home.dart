import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool ready = false;
  bool isDark = true;

  int newCasesLocal = 0;
  int totalCasesLocal = 0;
  int totalDeathsLocal = 0;

  void getData(){
    Dio().get('https://hpb.health.gov.lk/api/get-current-statistical').then((value) {
      //print(value);

      setState(() {
        newCasesLocal = value.data['data']['local_new_cases'];
        totalCasesLocal = value.data['data']['local_total_cases'];
        totalDeathsLocal = value.data['data']['local_deaths'];
        ready = true;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Status in Sri Lanka'),

        elevation: 0,
        actions: [
          IconButton(icon: Icon( isDark ? Icons.wb_sunny : Icons.nights_stay), onPressed:(){
            Get.changeTheme(isDark ? ThemeData.light():ThemeData.dark());
            setState(() {
              isDark = !isDark;
            });
          })
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Container(
              child: isDark ? Image.asset('assets/logoW.png'): Image.asset('assets/logo.png'),
            )),
            Flexible(child: Text(
                'An OpenSource Project by FOSS Community NSBM \nBased on an API Provided by HEALTH PROMOTION BUREAU',
                textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
      body: ready ? SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child:Card(

                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            children:[
                              Text('Total Cases: $totalCasesLocal',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 32, fontWeight: FontWeight.w900),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            children:[
                              Text('Total Deaths: $totalDeathsLocal',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:Card(

                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            children:[
                              Text('New Cases: $newCasesLocal',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width*0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(256)
                          )
                        ),
                        onPressed: (){}, child:
                    Text('Main Symptoms',  style: TextStyle(fontWeight: FontWeight.w600),)),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: Get.width*0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(32),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(256)
                            )
                        ),
                        onPressed: (){}, child:
                    Text('Prevention Methods',  style: TextStyle(fontWeight: FontWeight.w600),)),
                  ),


                ],
              )

            ],
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
