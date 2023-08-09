import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({Key? key}) : super(key: key);

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  final dateController = TextEditingController();
  String age = '0';

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
        appBar: AppBar(
          title: const Text('Date of Birth Picker'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
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
                    dateController.text = DateFormat('MM/dd/yyyy').format(date);
                  }
                },
              ),
              Text('You are $age years old!')
            ]))));
  }
}
