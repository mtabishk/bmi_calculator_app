import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  BMIResult({this.bmi, this.message, this.color});
  final bmi;
  final message;
  final color;

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var height = mq.size.height;
    var width = mq.size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[900],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.all(width * 0.1),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Your BMI ",
                style: TextStyle(
                  fontSize: height * 0.02,
                  color: Colors.white38,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                bmi,
                style: TextStyle(
                  fontSize: height * 0.08,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                message,
                style: TextStyle(
                  fontSize: height * 0.03,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
