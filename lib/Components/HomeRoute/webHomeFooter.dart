import 'package:flutter/material.dart';
import 'package:project_new_style/Setting/numbers.dart';

class WebHomeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 100,
            child: Image.asset('assets/logo.png'),
          ),
          Column(
            children: [
              Text(
                'شرکت نام شرکت شما',
                style: theme.textTheme.bodyText1,
                textDirection: TextDirection.rtl,
              ),
              Text(
                'تمامی حقوق محفوظ است ©',
                style: theme.textTheme.bodyText1,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(
                  'سؤالات متداول',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text(
                  'راهنمای سایت',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text(
                  'وبلاگ',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text(
                  'تیم توسعه',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(
                  'درباره ما',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text(
                  'تماس با ما',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text(
                  'تعرفه‌ها',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text(
                  'قوانین و مقررات',
                  style: theme.textTheme.bodyText1,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
