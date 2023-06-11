// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class popupButton extends StatelessWidget {
  popupButton({required this.onPressed, required this.btnText});

  final String btnText;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FractionallySizedBox(
        heightFactor: .4,
        widthFactor: .8,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)))),
          onPressed: onPressed,
          child: Text(
            btnText,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      //  ),
    );
  }
}
