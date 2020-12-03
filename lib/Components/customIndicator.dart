import 'package:flutter/material.dart';
import 'package:project_new_style/Styles/colors.dart';

class CustomIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        backgroundColor: themeColor,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
    ));
  }
}
