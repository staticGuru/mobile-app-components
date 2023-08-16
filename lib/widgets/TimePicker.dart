import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();
  handleTimepicker() async {
    final TimeOfDay? showTimeOfDay =
        await showTimePicker(context: context, initialTime: selectedTime);
    print(showTimeOfDay);
    if (showTimeOfDay != null) {
      setState(() {
        selectedTime = showTimeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Flex(direction: Axis.vertical, children: [
          const Text(
            "Date Time Picker",
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          ElevatedButton(
              onPressed: () async {
                await handleTimepicker();
              },
              child: Text(
                "show the Time ${selectedTime.hour}:${selectedTime.minute}",
                style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.wavy,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.amberAccent,
                    fontSize: 25),
              ))
        ]),
      )),
    );
  }
}
