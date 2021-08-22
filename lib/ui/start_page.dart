import 'package:bmi_app/ui/bmi_result.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int age = 21;
  int heightUser = 170;
  int weight = 60;
  // male == 0 and female == 1
  int gender = 0;

  // controllers for form text controllers
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void _modalBottomSheetMenu(
      TextEditingController _controller, dynamic mq, text) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                      ),
                      maxLength: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: mq.size.height * 0.03,
                      ),
                      autofocus: true,
                      onChanged: (val) {
                        try {
                          if (text.contains('Height')) {
                            heightUser = int.parse(val);
                          } else {
                            weight = int.parse(val);
                          }
                        } catch (e) {
                          print(
                            "Invalid Value $e",
                          );
                        }
                      },
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value) {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  void initState() {
    _heightController.text = heightUser.toString();
    _weightController.text = weight.toString();
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var height = mq.size.height;
    var width = mq.size.width;

    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.07),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "BMI Calculator ",
                      style: TextStyle(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "What you are? ",
                      style: TextStyle(
                        fontSize: height * 0.019,
                        color: Colors.white38,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.2),
                                gradient: LinearGradient(
                                  colors: gender == 0
                                      ? [Colors.blue, Colors.green]
                                      : [Colors.grey, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: IconButton(
                                  iconSize: width * 0.2,
                                  icon:
                                      Icon(CommunityMaterialIcons.gender_male),
                                  onPressed: () {
                                    setState(() {
                                      gender = 0;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: height * 0.019,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.2),
                                gradient: LinearGradient(
                                  colors: gender == 1
                                      ? [Colors.blue, Colors.green]
                                      : [Colors.grey, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: IconButton(
                                  iconSize: width * 0.2,
                                  icon: Icon(
                                      CommunityMaterialIcons.gender_female),
                                  onPressed: () {
                                    setState(() {
                                      gender = 1;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: height * 0.019,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Divider(
                      color: Colors.white60,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "What's your age? ",
                      style: TextStyle(
                        fontSize: height * 0.019,
                        color: Colors.white38,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "$age",
                            style: TextStyle(
                              fontSize: height * 0.09,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Column(
                          children: [
                            IconButton(
                              iconSize: height * 0.03,
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            IconButton(
                              iconSize: height * 0.03,
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white60,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "What's your Height? ",
                          style: TextStyle(
                            fontSize: height * 0.019,
                            color: Colors.white38,
                          ),
                        ),
                        Text(
                          "What's your Weight?",
                          style: TextStyle(
                            fontSize: height * 0.019,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _modalBottomSheetMenu(_heightController,
                                            mq, 'Enter your Height (cm)');
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${heightUser.toString()} ",
                                            style: TextStyle(
                                              fontSize: height * 0.08,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "Cm",
                                            style: TextStyle(
                                              fontSize: height * 0.02,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _modalBottomSheetMenu(_weightController,
                                            mq, 'Enter your Weight (kg)');
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${weight.toString()} ",
                                            style: TextStyle(
                                              fontSize: height * 0.08,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "Kg",
                                            style: TextStyle(
                                              fontSize: height * 0.02,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ]),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            final person = Person(
                                age: age, height: heightUser, weight: weight);
                            String message = "";
                            Color color = Colors.white38;
                            String bmi = person.bmi.toStringAsFixed(1);
                            if (double.parse(bmi) < 18.5) {
                              message = "You are too thin.";
                              color = Colors.yellow;
                            } else if (double.parse(bmi) > 18.5 &&
                                double.parse(bmi) < 25) {
                              message = "You are healthy.";
                              color = Colors.green;
                            } else if (double.parse(bmi) > 25 &&
                                double.parse(bmi) < 30) {
                              message = "You are overweight.";
                              color = Colors.orange;
                            } else {
                              message = "You are Obese.";
                              color = Colors.red;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BMIResult(
                                          bmi: bmi,
                                          message: message,
                                          color: color,
                                        )));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.green],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Calculate your BMI",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}

mixin BMI {
  double calculateBMI(double weight, double height) {
    return weight / (height / 100 * height / 100);
  }
}

class Person with BMI {
  Person({this.age, this.height, this.weight});

  final age;
  final height;
  final weight;

  double get bmi => calculateBMI(weight.toDouble(), height.toDouble());
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
