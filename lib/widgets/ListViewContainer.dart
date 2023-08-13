import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewContainer extends StatefulWidget {
  const ListViewContainer({Key? key}) : super(key: key);

  @override
  State<ListViewContainer> createState() => _ListViewContainerState();
}

class _ListViewContainerState extends State<ListViewContainer> {
  final ScrollController _controller = ScrollController();
  var _isNavVisible = true;
  var _dragContainerHeight = 0;
  var _onDragStart = 0.0;
  // var d = _dragContainerHeight.ceil();
  @override
  void initState() {
    _controller.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollEvent);
    super.dispose();
  }

  void _onScrollEvent() {
    final extentAfter = _controller.initialScrollOffset;

    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isNavVisible) {
        setState(() {
          _isNavVisible = false;
          print("**** $_isNavVisible up");
        });
      }
    }
    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isNavVisible) {
        setState(() {
          _isNavVisible = true;
          print("**** $_isNavVisible down");
        });
      }
    }
    print("Extent after: $extentAfter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 100,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: const Text(
                  "GFG",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                onTap: () {
                  _onScrollEvent();
                },
                title: Text("List item $index"));
          }),
      bottomNavigationBar: GestureDetector(
        onVerticalDragStart: (dragDetails) {
          // print("dragDetails $dragDetails");
          // setState(() {
          //   _onDragStart = dragDetails.localPosition.distance;
          //   _dragContainerHeight = 0;
          // });
          // print(dragDetails.globalPosition.distance);

          showModalBottomSheet<void>(
            context: context,
            backgroundColor: Colors.white38,
            // elevation: 0,
            builder: (BuildContext context) {
              return Container(
                color: Colors.black,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Flex(direction: Axis.vertical, children: [
                  Container(
                      color: Colors.white70,
                      width: double.maxFinite,
                      // height: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: const Text("guru")),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ListTile(
                          leading: new Icon(Icons.photo),
                          title: new Text('Photo'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: new Icon(Icons.music_note),
                          title: new Text('Music'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: new Icon(Icons.videocam),
                          title: new Text('Video'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: new Icon(Icons.share),
                          title: new Text('Share'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
              );
            },
          );
        },
        onVerticalDragUpdate: (details) {
          // setState(() {
          //   var value = (details.localPosition.distance - _onDragStart).ceil();
          //   _dragContainerHeight = (value > 350 || value <= 0)
          //       ? _dragContainerHeight.abs()
          //       : value;
          //   print(
          //       "onVerticalDragUpdate ====> $value, ${details.localPosition.distance}, $_onDragStart");
          // });

          // print(details.localPosition.distance);
        },
        onVerticalDragEnd: (details) {
          print("stopdetails, $_dragContainerHeight");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          height: _isNavVisible ? 130 : 80.0,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Flex(direction: Axis.vertical, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flex(direction: Axis.vertical, children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.white60,
                        size: 35,
                      ),
                    ),
                    _isNavVisible
                        ? const Text(
                            "Home",
                            style: TextStyle(color: Colors.white60),
                          )
                        : const SizedBox(width: 0.0, height: 0.0)
                  ]),
                  Flex(direction: Axis.vertical, children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.work_outline_outlined,
                        color: Colors.white60,
                        size: 35,
                      ),
                    ),
                    _isNavVisible
                        ? const Text(
                            "Work",
                            style: TextStyle(color: Colors.white60),
                          )
                        : const SizedBox(width: 0.0, height: 0.0)
                  ]),
                  Flex(direction: Axis.vertical, children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.widgets_outlined,
                        color: Colors.white60,
                        size: 35,
                      ),
                    ),
                    _isNavVisible
                        ? const Text(
                            "Widgets",
                            style: TextStyle(color: Colors.white60),
                          )
                        : const SizedBox(width: 0.0, height: 0.0)
                  ]),
                ],
              ),
            ),
            // Flexible(
            //   fit: FlexFit.tight,
            //   child: Container(
            //     color: Colors.red,
            //     width: double.maxFinite,
            //     height: double.maxFinite,
            //     margin: const EdgeInsets.symmetric(
            //         horizontal: 25.0, vertical: 25.0),
            //     child: Text("guru"),
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
