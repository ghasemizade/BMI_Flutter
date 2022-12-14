import 'package:bmi_flutter_app/constants/constants.dart';
import 'package:bmi_flutter_app/widgets/background_shape_left.dart';
import 'package:bmi_flutter_app/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0;
  String reslutText = '';
  double widthHelth = 100;
  double widthUnhelth = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(65),
          ),
        ),
        centerTitle: true,
        title: Text(
          'تو چنده ؟ BMI',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: orangeBackground),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن',
                      hintStyle:
                          TextStyle(color: orangeBackground.withOpacity(0.5)),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: orangeBackground),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد',
                      hintStyle:
                          TextStyle(color: orangeBackground.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBMI = weight / (height * height);
                  if (resultBMI > 25) {
                    widthUnhelth = 300;
                    widthHelth = 50;
                    reslutText = 'شما اضافه وزن دارید';
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    widthHelth = 150;
                    widthUnhelth = 150;
                    reslutText = 'وزن شما نرمال است';
                  } else {
                    widthHelth = 50;
                    widthUnhelth = 50;
                    reslutText = 'وزن شما کم‌تر از حد نرمال است';
                  }
                });
              },
              child: Text(
                '! محاسبه کن',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '${resultBMI.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
            ),
            Text(
              '$reslutText',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: resultBMI >= 25 ? Colors.red : Colors.green),
            ),
            SizedBox(
              height: 80,
            ),
            RightShape(
              widht: widthUnhelth,
            ),
            SizedBox(
              height: 15,
            ),
            LeftShape(
              width: widthHelth,
            ),
          ],
        ),
      ),
    );
  }
}
