import 'package:flutter/material.dart';

sliderComponent() {
  double selectedRadio = 0;
  double _startValue = 0;
  double _endValue = 100.0;
  double _colorSlider = 0;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        const SizedBox(
          height: 50.0,
        ),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Slider(
            min: 0.0,
            max: 100.0,
            value: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value;
              });
            },
          );
        }),
        const SizedBox(
          height: 50.0,
        ),
        const Text("Range Slider"),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return RangeSlider(
            min: 0.0,
            max: 100.0,
            values: RangeValues(_startValue, _endValue),
            onChanged: (values) {
              setState(() {
                _startValue = values.start;
                _endValue = values.end;
              });
            },
          );
        }),
        const SizedBox(
          height: 50.0,
        ),
        const Text("MultiColor Slider"),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Slider(
            min: 0.0,
            max: 100.0,
            activeColor: Colors.purple,
            inactiveColor: Colors.purple.shade100,
            thumbColor: Colors.pink,
            value: _colorSlider,
            onChanged: (value) {
              setState(() {
                _colorSlider = value;
              });
            },
          );
        }),
        const SizedBox(
          height: 50.0,
        ),
        const Text("ToolTip slider"),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return RangeSlider(
            min: 0.0,
            max: 100.0,
            divisions: 10,
            labels: RangeLabels(
              _startValue.round().toString(),
              _endValue.round().toString(),
            ),
            values: RangeValues(_startValue, _endValue),
            onChanged: (values) {
              setState(() {
                _startValue = values.start;
                _endValue = values.end;
              });
            },
          );
        })
      ],
    ),
  );
}
