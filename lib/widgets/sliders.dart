import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/widgets/BottomSheetComponent.dart';
import 'package:widgets_app/widgets/ProgressBarComponent.dart';
import 'package:widgets_app/widgets/activityIndicator.dart';
import 'package:widgets_app/widgets/agePicker.dart';
import 'package:widgets_app/widgets/audioComponent.dart';
import 'package:widgets_app/widgets/card.dart';
import 'package:widgets_app/widgets/sliderComponent.dart';
import 'package:widgets_app/widgets/videoComponent.dart';

class SliderPlugin extends StatefulWidget {
  const SliderPlugin({Key? key, required this.images}) : super(key: key);

  final List images;
  @override
  State<SliderPlugin> createState() => _SliderPluginState();
}

class _SliderPluginState extends State<SliderPlugin> {
  int activeSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.images[activeSlide])),
      body: PageView.builder(
          itemCount: widget.images.length,
          pageSnapping: true,
          onPageChanged: (value) {
            setState(() {
              print(value);
              activeSlide = value;
            });
          },
          itemBuilder: (context, pagePosition) {
            return pagePosition == 0
                ? const AgePicker()
                : widget.images[pagePosition] == "card"
                    ? CardDesign()
                    : widget.images[pagePosition] == "slider"
                        ? sliderComponent()
                        : widget.images[pagePosition] == "progressBar"
                            ? ProgressBarComponent()
                            : widget.images[pagePosition] == "activityIndicator"
                                ? ActivityIndicator()
                                : widget.images[pagePosition] == "Bottom Bar"
                                    ? BottomSheetComponent(context)
                                    : widget.images[pagePosition] == "Video"
                                        ? const VideoComponent()
                                        : widget.images[pagePosition] == "audio"
                                            ? AudioComponent()
                                            : GestureDetector(
                                                onTap: () =>
                                                    print(pagePosition),
                                                child: Image.network(widget
                                                    .images[pagePosition]));
          }),
    );
  }
}

// ignore: non_constant_identifier_names
// SliderPlugin(List<String> images) {
//   List<String> images = [
//     "https://images.unsplash.com/photo-1682685797406-97f364419b4a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
//     "https://images.unsplash.com/photo-1682685797406-97f364419b4a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
//     "https://wallpaperaccess.com/full/2637581.jpg",
//     "card"
//   ];
//   return PageView.builder(
//       itemCount: images.length,
//       pageSnapping: true,
//       itemBuilder: (context, pagePosition) {
//         return pagePosition == 0
//             ? const AgePicker()
//             : images[pagePosition] == "card"
//                 ? CardDesign()
//                 : GestureDetector(
//                     onTap: () => print(pagePosition),
//                     child: Image.network(images[pagePosition]));
//       });
// }
