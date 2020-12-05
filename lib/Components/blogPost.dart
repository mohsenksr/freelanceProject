import 'package:flutter/material.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class BlogPost extends StatelessWidget {
  final String _imageUrl;
  final String _title;
  final String _date;

  BlogPost(this._title, this._imageUrl, this._date);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              // height: _width / 4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  'https://cdn.mashreghnews.ir/d/2017/04/09/2/1901522.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _date,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: mainFontFamily,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    // Spacer(),
                    // FavoriteWidget()
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    _title,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: mainFontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: themeColor,
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'ادامه مطلب',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontFamily: mainFontFamily),
                            )),
                      ),
                      onTap: () => {},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
