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
  double bmi = 0.00;
  String bmiReport = "";

  void generateReport() {
    String message = "Your BMI is:${bmi.ceil()} You are";
    if (bmi < 18) {
      setState(() {
        bmiReport = "$message Under Weight";
      });
    } else if (bmi < 25) {
      setState(() {
        bmiReport = "$message Normal";
      });
    } else if (bmi < 30) {
      setState(() {
        bmiReport = "$message Over Weight";
      });
    } else if (bmi < 35) {
      setState(() {
        bmiReport = "$message Obesity(Class I)";
      });
    } else if (bmi < 40) {
      setState(() {
        bmiReport = "$message Obesity(Class II)";
      });
    } else {
      setState(() {
        setState(() {
          bmiReport = "$message Extreme Obesity";
        });
      });
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    double height = double.parse(heightcontroller.text);
                    double weight = double.parse(weightcontroller.text);
                    setState(() {
                      bmi = weight / (height * height);
                    });
                    generateReport();
                    setState(() {
                      isCalculator = true;
                    });
                    generateReport();
                    print(bmi);
                    print(bmiReport);
                  },
                  icon: Icon(Icons.send),
                  label: Text("Calculator")),
              ElevatedButton.icon(
                  onPressed: () {
                    heightcontroller.clear();
                    weightcontroller.clear();
                    setState(() {
                      isCalculator = false;
                    });
                  },
                  icon: Icon(Icons.send),
                  label: Text("Reset")),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: devicewidth,
            height: deviceHeight * 0.08,
            color: Colors.blue,
            child: Text(
              isCalculator ? bmiReport : "Result Button".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
