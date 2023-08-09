import 'package:flutter/material.dart';

CardDesign() {
  return Center(
    child: Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.greenAccent[100],
      child: SizedBox(
        width: 300,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green[500],
                  radius: 108,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png"), //NetworkImage
                    radius: 100,
                  ), //CircleAvatar
                ), //CircleAvatar
                const SizedBox(
                  height: 10,
                ), //SizedBox
                Text(
                  'React',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green[900],
                    fontWeight: FontWeight.w500,
                  ), //Textstyle
                ), //Text
                const SizedBox(
                  height: 10,
                ), //SizedBox
                const Text(
                  'React native and Flutter is cross platform mobile application development platform to encage with techno background cross platform mobile application development platform to encage with techno background!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                  ), //Textstyle
                ), //Text
                // const SizedBox(
                //   height: 10,
                // ), //SizedBox
                SizedBox(
                  width: 100,
            
                  child: ElevatedButton(
                    onPressed: () => 'Null',
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green)),
                    child: const Padding(
                      padding: const EdgeInsets.all(4),
                      child: Expanded(
                        child: Row(
                          children: [Icon(Icons.touch_app), Text('Visit')],
                        ),
                      ),
                    ),
                  ),
                  // RaisedButton is deprecated and should not be used
                  // Use ElevatedButton instead
            
                  // child: RaisedButton(
                  //   onPressed: () => null,
                  //   color: Colors.green,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(4.0),
                  //     child: Row(
                  //       children: const [
                  //         Icon(Icons.touch_app),
                  //         Text('Visit'),
                  //       ],
                  //     ), //Row
                  //   ), //Padding
                  // ), //RaisedButton
                ) //SizedBox
              ],
            ),
          ), //Column
        ), //Padding
      ),
    ),
  );
}
