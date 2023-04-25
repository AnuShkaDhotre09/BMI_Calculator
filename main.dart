import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = " ";
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Container(
          color: bgColor,
          child: Center(
              child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w700),
                      ),
                      TextField(
                        controller: wtController,
                        decoration: InputDecoration(
                          label: Text('Enter Your Weight'),
                          prefixIcon: Icon(Icons.line_weight),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: ftController,
                        decoration: InputDecoration(
                          label: Text('Enter Your Height(in feet)'),
                          prefixIcon: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      TextField(
                        controller: inController,
                        decoration: InputDecoration(
                          label: Text('Enter Your Height(in ichs)'),
                          prefixIcon: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            var wt = wtController.text;
                            var ft = ftController.text;
                            var inch = inController.text;

                            if (wt != "" && ft != "" && inch != "") {
                              //BMI calculation
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);
                              var iInch =
                                  int.parse(inch); //change string into int

                              //convert into meter
                              var tInch = (iFt * 12) + iInch;

                              //cm
                              var tCm = tInch * 2.54;

                              //convert into meter
                              var tM = tCm / 100;

                              var bmi = iWt / (tM * tM);

                              var msg = "";
                              if (bmi > 25) {
                                msg = "You're OverWeight!!";
                                bgColor = Colors.orange.shade200;
                              } else if (bmi < 18) {
                                msg = "You're UnderWeight!!";
                                bgColor = Colors.red.shade200;
                              } else {
                                msg = "You're Healthy!!";
                                bgColor = Colors.green.shade200;
                              }

                              setState(() {
                                result =
                                    "$msg \n Your BMI is :${bmi.toStringAsFixed(2)}";
                              });
                            } else {
                              setState(() {
                                result =
                                    "Please fill all the required blanks!!";
                              });
                            }
                          },
                          child: Text('Calculate')),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        result,
                        style: TextStyle(fontSize: 19),
                      )
                    ],
                  ))),
        ));
  }
}
