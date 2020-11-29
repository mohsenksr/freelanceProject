import 'package:flutter/material.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('about us'),
          RaisedButton(
            child: Text(
              'go back',
              style: normalText,
            ),
            onPressed: () => Navigator.pop(context),
            color: themeColor,
          ),
        ],
      ),
    );
  }
}
