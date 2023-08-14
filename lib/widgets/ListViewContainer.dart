import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewContainer extends StatefulWidget {
  const ListViewContainer({Key? key}) : super(key: key);

  @override
  State<ListViewContainer> createState() => _ListViewContainerState();
}

class _ListViewContainerState extends State<ListViewContainer> {
  final ScrollController _controller = ScrollController();
  var _isNavVisible = true;
  var _activeTab = 1;
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

  List<List<Color>> colors = <List<Color>>[
    [
      Colors.redAccent,
      Colors.red.shade200,
    ],
    [
      Colors.pinkAccent,
      Colors.pink.shade200,
    ],
    [
      Colors.yellowAccent,
      Colors.yellow.shade200,
    ],
    [
      Colors.orangeAccent,
      Colors.orange.shade200,
    ],
    [
      Colors.purpleAccent,
      Colors.purple.shade200,
    ],
    [Colors.cyanAccent, Colors.cyan.shade200]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20, //total no of list items
        itemBuilder: (BuildContext context, int currentitem) {
          return GestureDetector(
            onTap: () {
              print("tapped on item $currentitem");
            },
            child: Container(
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: colors[currentitem % colors.length]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black54,
                      blurRadius: 3.5,
                      offset: new Offset(1.0, 2.0)),
                ],
              ),
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              height: 150,
              child: Row(
                children: <Widget>[
                  Expanded(
                    //left half image avtar of listitem
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 15),
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    //center of listitem
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Lorem Ipsum",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text("Some SubTitle")
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        child: Column(
                                      children: <Widget>[
                                        Text("$currentitem\43"),
                                        Text("Popularity",
                                            style: TextStyle(fontSize: 12))
                                      ],
                                    )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        child: Column(
                                      children: <Widget>[
                                        Text("$currentitem\433"),
                                        Text("Like",
                                            style: TextStyle(fontSize: 12))
                                      ],
                                    )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        child: Column(
                                      children: <Widget>[
                                        Text("$currentitem\4333"),
                                        Text(
                                          "Followed",
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    //right half of listitem
                    flex: 1,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                          Text(
                            "$currentitem",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text("Ranking")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
            clipBehavior: Clip.antiAliasWithSaveLayer,
            isScrollControlled: true,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: Colors.white.withOpacity(0.2),
            barrierColor: Colors.white.withOpacity(0.2),
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (_, StateSetter setState /*You can rename this!*/) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80,
                    sigmaY: 80,
                  ),
                  child: Container(
                    color: Colors.transparent,
                    // constraints: BoxConstraints(
                    //   maxHeight: MediaQuery.of(context).size.height / 1.5,
                    // ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Flex(direction: Axis.vertical, children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height / 1.5,
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flex(direction: Axis.vertical, children: [
                                IconButton(
                                  enableFeedback: false,
                                  onPressed: () {
                                    setState(() {
                                      _activeTab = 1;
                                    });
                                  },
                                  icon: _activeTab == 1
                                      ? const Icon(
                                          Icons.home_filled,
                                          color: Colors.orangeAccent,
                                          size: 35,
                                        )
                                      : const Icon(
                                          Icons.home_outlined,
                                          color: Colors.white60,
                                          size: 35,
                                        ),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: _activeTab == 1
                                          ? Colors.orangeAccent
                                          : Colors.white60),
                                )
                              ]),
                              Flex(direction: Axis.vertical, children: [
                                IconButton(
                                  enableFeedback: false,
                                  onPressed: () {
                                    setState(() {
                                      _activeTab = 2;
                                    });
                                  },
                                  icon: _activeTab == 2
                                      ? const Icon(
                                          Icons.work_rounded,
                                          color: Colors.orangeAccent,
                                          size: 35,
                                        )
                                      : const Icon(
                                          Icons.work_outline_outlined,
                                          color: Colors.white60,
                                          size: 35,
                                        ),
                                ),
                                Text(
                                  "Work",
                                  style: TextStyle(
                                      color: _activeTab == 2
                                          ? Colors.orangeAccent
                                          : Colors.white60),
                                )
                              ]),
                              Flex(direction: Axis.vertical, children: [
                                IconButton(
                                  enableFeedback: false,
                                  onPressed: () {
                                    setState(() {
                                      _activeTab = 3;
                                    });
                                  },
                                  icon: _activeTab == 3
                                      ? const Icon(
                                          Icons.widgets_rounded,
                                          color: Colors.orangeAccent,
                                          size: 35,
                                        )
                                      : const Icon(
                                          Icons.widgets_outlined,
                                          color: Colors.white60,
                                          size: 35,
                                        ),
                                ),
                                Text(
                                  "Widgets",
                                  style: TextStyle(
                                      color: _activeTab == 3
                                          ? Colors.orangeAccent
                                          : Colors.white60),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black87,
                          ),
                          // margin: const EdgeInsets.symmetric(
                          //     horizontal: 20.0, vertical: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    gradient: LinearGradient(
                                      // Where the linear gradient begins and ends
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        // Colors are easy thanks to Flutter's Colors class.
                                        Colors.blue.shade900,
                                        Colors.blue,
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 25.0),
                                    child: Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        const SizedBox(
                                          width: 30.0,
                                        ),
                                        new Icon(
                                          Icons.qr_code,
                                          color: Colors.white,
                                          size: 36.0,
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        new Text('Scan QR to pay',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 25.0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        new Icon(
                                          Icons.euro_rounded,
                                          color: Colors.amber,
                                          size: 106.0,
                                        ),
                                        const SizedBox(
                                          width: 30.0,
                                        ),
                                        Flex(
                                            direction: Axis.vertical,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('153',
                                                  style: GoogleFonts.ebGaramond(
                                                    textStyle: const TextStyle(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      color: Colors.white70,
                                                      fontSize: 80,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                              Text('Supercoin Balance',
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ])
                                      ],
                                    ),
                                  ),
                                ),
                                Flex(direction: Axis.horizontal, children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: Container(
                                      height: 130,
                                      decoration: const BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      width: double.maxFinite,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Flexible(
                                    flex: 3,
                                    fit: FlexFit.loose,
                                    child: Container(
                                      height: 130,
                                      width: double.maxFinite,
                                      decoration: const BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              });
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          height: _isNavVisible ? 100 : 80,
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.all(Radius.circular(40)),
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
                      onPressed: () {
                        setState(() {
                          _activeTab = 1;
                        });
                      },
                      icon: _activeTab == 1
                          ? const Icon(
                              Icons.home_filled,
                              color: Colors.orangeAccent,
                              size: 35,
                            )
                          : const Icon(
                              Icons.home_outlined,
                              color: Colors.white60,
                              size: 35,
                            ),
                    ),
                    _isNavVisible
                        ? Text(
                            "Home",
                            style: TextStyle(
                                color: _activeTab == 1
                                    ? Colors.orangeAccent
                                    : Colors.white60),
                          )
                        : const SizedBox(width: 0.0, height: 0.0)
                  ]),
                  Flex(direction: Axis.vertical, children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          _activeTab = 2;
                        });
                      },
                      icon: _activeTab == 2
                          ? const Icon(
                              Icons.work_rounded,
                              color: Colors.orangeAccent,
                              size: 35,
                            )
                          : Icon(
                              Icons.work_outline_outlined,
                              color: Colors.white60,
                              size: 35,
                            ),
                    ),
                    _isNavVisible
                        ? Text(
                            "Work",
                            style: TextStyle(
                                color: _activeTab == 2
                                    ? Colors.orangeAccent
                                    : Colors.white60),
                          )
                        : const SizedBox(width: 0.0, height: 0.0)
                  ]),
                  Flex(direction: Axis.vertical, children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          _activeTab = 3;
                        });
                      },
                      icon: _activeTab == 3
                          ? const Icon(
                              Icons.widgets_rounded,
                              color: Colors.orangeAccent,
                              size: 35,
                            )
                          : const Icon(
                              Icons.widgets_outlined,
                              color: Colors.white60,
                              size: 35,
                            ),
                    ),
                    _isNavVisible
                        ? Text(
                            "Widgets",
                            style: TextStyle(
                                color: _activeTab == 3
                                    ? Colors.orangeAccent
                                    : Colors.white60),
                          )
                        : const SizedBox(width: 0.0, height: 0.0)
                  ]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
