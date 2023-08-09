import 'package:flutter/material.dart';

BottomSheetComponent(context) {
  return Center(
      child: ElevatedButton(
          child: const Text('showModalBottomSheet'),
          onPressed: () {
            // when raised button is pressed
            // we display showModalBottomSheet
            showModalBottomSheet<void>(
              // context and builder are
              // required properties in this widget
              context: context,
              builder: (BuildContext context) {
                // we set up a container inside which
                // we create center column and display text

                // Returning SizedBox instead of a Container
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Guruvignesh bottom bar components'),
                        Text('Guruvignesh bottom bar components'),
                        Text('Guruvignesh bottom bar components'),
                      ],
                    ),
                  ),
                );
              },
            );
          }));
}
