import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioComponent extends StatefulWidget {
  AudioComponent({Key? key}) : super(key: key);

  @override
  State<AudioComponent> createState() => _AudioComponentState();
}

class _AudioComponentState extends State<AudioComponent> {
  final player = AudioPlayer();
  dynamic playerState = "";
  double duration = 0.0;
  double position = 0.0;
  double myDuration(Duration duration) {
    var date = duration.toString().split(":");
    var hrs = date[0];
    var mns = date[1];
    var sds = date[2].split(".")[0];
    var sec = mns * 60 + sds;
    return double.parse(sec);
  }

  @override
  void initState() {
    super.initState();
    print("initState() called");
    player.onPlayerStateChanged.listen((PlayerState s) =>
        {print('Current player state: $s'), setState(() => playerState = s)});
    player.onDurationChanged.listen((Duration d) {
      print(myDuration(d).toStringAsFixed(2));
      setState(() => duration = myDuration(d));
    });
    player.onPositionChanged.listen((Duration p) =>
        {print(myDuration(p)), setState(() => position = myDuration(p))});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  // Handle previous button pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  player.play(UrlSource(
                      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"));
                  // Handle play button pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  player.stop();
                  // Handle pause button pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  // Handle next button pressed
                },
              ),
            ],
          ),
          // ElevatedButton(
          //   child: playerState == PlayerState.playing
          //       ? const Text("Stop")
          //       : const Text("Play"),
          //   onPressed: () {
          //     playerState == PlayerState.playing
          //         ? player.stop()
          //         : player.play(UrlSource(
          //             "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"));
          //     // "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3");
          //   },
          // ),
          Center(
            child: StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Slider(
                  min: 0.0,
                  max: duration,
                  value: position,
                  onChanged: (value) {
                    setState(() {});
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
// import 'package:flutter/services.dart';
// import 'dart:typed_data';

// class AudioComponent extends StatefulWidget {
//   AudioComponent({Key? key}) : super(key: key);

//   @override
//   State<AudioComponent> createState() => _AudioComponentState();
// }

// class _AudioComponentState extends State<AudioComponent> {
//   int maxduration = 100;
//   int currentpos = 0;
//   String currentpostlabel = "00:00";
//   String audioasset = "assets/audio/file.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   late Uint8List audiobytes;

//   AudioPlayer player = AudioPlayer();

//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () async {
//       ByteData bytes =
//           await rootBundle.load(audioasset); //load audio from assets
//       audiobytes =
//           bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//       //convert ByteData to Uint8List

//       player.onDurationChanged.listen((Duration d) {
//         //get the duration of audio
//         maxduration = d.inMilliseconds;
//         setState(() {});
//       });

//       player.onAudioPositionChanged.listen((Duration p) {
//         currentpos =
//             p.inMilliseconds; //get the current position of playing audio

//         //generating the duration label
//         int shours = Duration(milliseconds: currentpos).inHours;
//         int sminutes = Duration(milliseconds: currentpos).inMinutes;
//         int sseconds = Duration(milliseconds: currentpos).inSeconds;

//         int rhours = shours;
//         int rminutes = sminutes - (shours * 60);
//         int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

//         currentpostlabel = "$rhours:$rminutes:$rseconds";

//         setState(() {
//           //refresh the UI
//         });
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(top: 50),
//         child: Column(
//           children: [
//             Container(
//               child: Text(
//                 currentpostlabel,
//                 style: TextStyle(fontSize: 25),
//               ),
//             ),
//             Container(
//                 child: Slider(
//               value: double.parse(currentpos.toString()),
//               min: 0,
//               max: double.parse(maxduration.toString()),
//               divisions: maxduration,
//               label: currentpostlabel,
//               onChanged: (double value) async {
//                 int seekval = value.round();
//                 int result = await player.seek(Duration(milliseconds: seekval));
//                 if (result == 1) {
//                   //seek successful
//                   currentpos = seekval;
//                 } else {
//                   print("Seek unsuccessful.");
//                 }
//               },
//             )),
//             Container(
//               child: Wrap(
//                 spacing: 10,
//                 children: [
//                   ElevatedButton.icon(
//                       onPressed: () async {
//                         if (!isplaying && !audioplayed) {
//                           int result = await player.playBytes(audiobytes);
//                           if (result == 1) {
//                             //play success
//                             setState(() {
//                               isplaying = true;
//                               audioplayed = true;
//                             });
//                           } else {
//                             print("Error while playing audio.");
//                           }
//                         } else if (audioplayed && !isplaying) {
//                           int result = await player.resume();
//                           if (result == 1) {
//                             //resume success
//                             setState(() {
//                               isplaying = true;
//                               audioplayed = true;
//                             });
//                           } else {
//                             print("Error on resume audio.");
//                           }
//                         } else {
//                           int result = await player.pause();
//                           if (result == 1) {
//                             //pause success
//                             setState(() {
//                               isplaying = false;
//                             });
//                           } else {
//                             print("Error on pause audio.");
//                           }
//                         }
//                       },
//                       icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
//                       label: Text(isplaying ? "Pause" : "Play")),
//                   ElevatedButton.icon(
//                       onPressed: () async {
//                         int result = await player.stop();
//                         if (result == 1) {
//                           //stop success
//                           setState(() {
//                             isplaying = false;
//                             audioplayed = false;
//                             currentpos = 0;
//                           });
//                         } else {
//                           print("Error on stop audio.");
//                         }
//                       },
//                       icon: Icon(Icons.stop),
//                       label: Text("Stop")),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }


// // // import 'dart:ui';
// // // // import 'package:audioplayers/audio_cache.dart';
// // // import 'package:audioplayers/audioplayers.dart';
// // // import 'package:flutter/material.dart';

// // // class AudioComponent extends StatefulWidget {
// // //   const AudioComponent({Key? key}) : super(key: key);

// // //   @override
// // //   State<AudioComponent> createState() => _AudioComponentState();
// // // }

// // // abstract class _AudioComponentState extends State<AudioComponent>
// // //     with TickerProviderStateMixin {
// // //   late AnimationController _animationIconController1;
// // //   late AudioCache audioCache;
// // //   late AudioPlayer audioPlayer;
// // //   Duration _duration = new Duration();
// // //   Duration _position = new Duration();
// // //   Duration _slider = new Duration(seconds: 0);
// // //   late double durationvalue;
// // //   bool issongplaying = false;
// // //   void initState() {
// // //     super.initState();
// // //     _position = _slider;
// // //     _animationIconController1 = AnimationController(
// // //       vsync: this,
// // //       duration: Duration(milliseconds: 750),
// // //       reverseDuration: Duration(milliseconds: 750),
// // //     );
// // //     audioPlayer = AudioPlayer();
// // //     // audioCache = AudioCache(audioPlayer);
// // //   //   audioPlayer.durationHandler = (d) => setState(() {
// // //   //         _duration = d;
// // //   //       });

// // //   //   audioPlayer.positionHandler = (p) => setState(() {
// // //   //         _position = p;
// // //   //       });
// // //   // }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       child: BackdropFilter(
// // //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
// // //         child: Container(
// // //           width: (MediaQuery.of(context).size.width),
// // //           height: (MediaQuery.of(context).size.height),
// // //           child: Center(
// // //             child: Column(
// // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //               children: [
// // //                 ClipOval(
// // //                   child: Image(
// // //                     image: AssetImage("assets/images/color1.jpg"),
// // //                     width: (MediaQuery.of(context).size.width) - 200,
// // //                     height: (MediaQuery.of(context).size.width) - 200,
// // //                     fit: BoxFit.fill,
// // //                   ),
// // //                 ),
// // //                 Slider(
// // //                   activeColor: Colors.white,
// // //                   inactiveColor: Colors.grey,
// // //                   value: _position.inSeconds.toDouble(),
// // //                   max: _duration.inSeconds.toDouble(),
// // //                   onChanged: (double value) {
// // //                     // Add code to track the music duration.
// // //                   },
// // //                 ),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                   children: [
// // //                     Icon(
// // //                       Icons.navigate_before,
// // //                       size: 55,
// // //                       color: Colors.white,
// // //                     ),
// // //                     GestureDetector(
// // //                       onTap: () {
// // //                         // Add code to pause and play the music.
// // //                       },
// // //                       child: ClipOval(
// // //                         child: Container(
// // //                           color: Colors.pink[600],
// // //                           child: Padding(
// // //                             padding: const EdgeInsets.all(8.0),
// // //                             child: AnimatedIcon(
// // //                               icon: AnimatedIcons.play_pause,
// // //                               size: 55,
// // //                               progress: _animationIconController1,
// // //                               color: Colors.white,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     Icon(
// // //                       Icons.navigate_next,
// // //                       size: 55,
// // //                       color: Colors.white,
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
