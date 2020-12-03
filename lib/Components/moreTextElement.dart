import 'package:flutter/material.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class MoreTextElement extends StatelessWidget {
  final Map<String, Object> item;
  final String headerKey;
  final String contentKey;
  final IconData itemIcon;

  MoreTextElement(
    this.item,
    this.headerKey,
    this.contentKey,
    this.itemIcon,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: lightThemeColor,
          elevation: 10,
          margin: EdgeInsets.symmetric(
            vertical: 1,
            horizontal: 5,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      itemIcon,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.83,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      child: Text(
                        item[headerKey],
                        style: TextStyle(
                          fontFamily: mainFontFamily,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 3,
                ),
                Text(
                  item[contentKey],
                  style: TextStyle(
                    fontFamily: mainFontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 10,
        )
      ],
    );
  }
}
