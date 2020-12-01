import 'package:flutter/material.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class NormalAppBar extends StatelessWidget {
  final String _title;
  final bool _activeBackButton;

  NormalAppBar(this._title, this._activeBackButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeColor,
      width: double.infinity,
      height: 80,
      child: Column(
        children: [
          Expanded(
            child: SizedBox.shrink(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                _activeBackButton
                    ? Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      )
                    : SizedBox.shrink(),
                Expanded(
                  child: Center(
                    child: Text(
                      _title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: mainFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                _activeBackButton
                    ? Container(
                        width: 40,
                        height: 40,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
