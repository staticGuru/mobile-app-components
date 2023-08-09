import 'package:flutter/material.dart';

ProgressBarComponent() {
  return const Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 40,
          ),
          LinearProgressIndicator(),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            strokeWidth: 10,
          ),
          SizedBox(
            height: 40,
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.redAccent,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            minHeight: 20,
          )
        ],
      ),
    ),
  );
}
