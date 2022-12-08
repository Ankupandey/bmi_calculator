import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  bool isCalculator = false;
  String bmiResult = "";
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: devicewidth,
            height: deviceHeight * 0.20,
            color: Colors.blue,
            child: Text(
              "BMI Calculator".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: devicewidth * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: devicewidth * 0.01),
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: heightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height",
                        helperText: "Enter Height in Meter"),
                  ),
                  TextFormField(
                    controller: weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight", helperText: "Enter Weight in Kg"),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text("Calculator")),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text("Reset")),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: devicewidth,
            height: deviceHeight * 0.08,
            color: Colors.pink,
            child: Text(
              "Result Button".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
