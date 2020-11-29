import 'package:flutter/material.dart';
import './../Styles/colors.dart';
import './../Styles/textStyles.dart';

class MessagesRoute extends StatefulWidget {
  @override
  _MessagesRouteState createState() => _MessagesRouteState();
}

class _MessagesRouteState extends State<MessagesRoute> {
  int _state = 0;

  changeState() {
    setState(() {
      if (_state == 0) {
        _state = 1;
      } else {
        _state = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'messages state: ' + _state.toString(),
            style: normalText,
          ),
          RaisedButton(
            child: Text(
              'change state',
              style: normalText,
            ),
            onPressed: () => changeState(),
            color: themeColor,
          ),
        ],
      ),
    );
  }
}
