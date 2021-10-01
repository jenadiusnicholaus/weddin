import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      showOnOff: true,
      activeTextColor: Colors.black,
      inactiveTextColor: Colors.black,
      value: isSwitched,
      onToggle: (val) {
        setState(() {
          isSwitched = val;
        });
      },
    );
  }
}
