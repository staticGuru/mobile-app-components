import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class AgePicker extends StatefulWidget {
  const AgePicker({Key? key}) : super(key: key);

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  final dateController = TextEditingController();
  String age = '0';
  int _currentHorizontalIntValue = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    print(currentDate);
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: [
                TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: const InputDecoration(hintText: 'Pick your Date'),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      setState(() {
                        age = calculateAge(date);
                      });
                      dateController.text =
                          DateFormat('MM/dd/yyyy').format(date);
                    }
                  },
                ),
                Text('You are $age years old!'),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your age",
                      style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                          backgroundColor: Colors.transparent,
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We use this to tailor the app and find better and more personal offers,",
                    style: GoogleFonts.ebGaramond(
                      textStyle: const TextStyle(
                        backgroundColor: Colors.transparent,
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 3),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    widthFactor: MediaQuery.of(context).size.width,
                    child: NumberPicker(
                      value: _currentHorizontalIntValue,
                      minValue: 0,
                      maxValue: 99,
                      step: 1,
                      itemHeight: 200,
                      itemWidth: MediaQuery.of(context).size.width / 3,
                      axis: Axis.horizontal,
                      onChanged: (value) => setState(() => {
                            _currentHorizontalIntValue = value,
                            // print("sdfsdf ${widget.controller}")
                          }),
                      selectedTextStyle: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                          backgroundColor: Colors.transparent,
                          color: Colors.black,
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textStyle: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                          backgroundColor: Colors.transparent,
                          color: Colors.black45,
                          fontSize: 110,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            )));
  }
}
