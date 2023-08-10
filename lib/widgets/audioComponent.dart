import 'package:flutter/material.dart';

class AudioComponent extends StatefulWidget {
  AudioComponent({Key? key}) : super(key: key);

  @override
  State<AudioComponent> createState() => _AudioComponentState();
}

class _AudioComponentState extends State<AudioComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// import 'dart:ui';
// // import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class AudioComponent extends StatefulWidget {
//   const AudioComponent({Key? key}) : super(key: key);

//   @override
//   State<AudioComponent> createState() => _AudioComponentState();
// }

// abstract class _AudioComponentState extends State<AudioComponent>
//     with TickerProviderStateMixin {
//   late AnimationController _animationIconController1;
//   late AudioCache audioCache;
//   late AudioPlayer audioPlayer;
//   Duration _duration = new Duration();
//   Duration _position = new Duration();
//   Duration _slider = new Duration(seconds: 0);
//   late double durationvalue;
//   bool issongplaying = false;
//   void initState() {
//     super.initState();
//     _position = _slider;
//     _animationIconController1 = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 750),
//       reverseDuration: Duration(milliseconds: 750),
//     );
//     audioPlayer = AudioPlayer();
//     // audioCache = AudioCache(audioPlayer);
//   //   audioPlayer.durationHandler = (d) => setState(() {
//   //         _duration = d;
//   //       });

//   //   audioPlayer.positionHandler = (p) => setState(() {
//   //         _position = p;
//   //       });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//         child: Container(
//           width: (MediaQuery.of(context).size.width),
//           height: (MediaQuery.of(context).size.height),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ClipOval(
//                   child: Image(
//                     image: AssetImage("assets/images/color1.jpg"),
//                     width: (MediaQuery.of(context).size.width) - 200,
//                     height: (MediaQuery.of(context).size.width) - 200,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Slider(
//                   activeColor: Colors.white,
//                   inactiveColor: Colors.grey,
//                   value: _position.inSeconds.toDouble(),
//                   max: _duration.inSeconds.toDouble(),
//                   onChanged: (double value) {
//                     // Add code to track the music duration.
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Icon(
//                       Icons.navigate_before,
//                       size: 55,
//                       color: Colors.white,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Add code to pause and play the music.
//                       },
//                       child: ClipOval(
//                         child: Container(
//                           color: Colors.pink[600],
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: AnimatedIcon(
//                               icon: AnimatedIcons.play_pause,
//                               size: 55,
//                               progress: _animationIconController1,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Icon(
//                       Icons.navigate_next,
//                       size: 55,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
