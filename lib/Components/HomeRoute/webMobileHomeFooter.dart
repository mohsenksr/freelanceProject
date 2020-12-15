import 'package:flutter/material.dart';
import 'package:project_new_style/Setting/numbers.dart';

class WebMobileHomeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: _width / 4,
                child: Image.asset('assets/logo.png'),
              ),
              Text(
                'شرکت نام شرکت شما',
                style: theme.textTheme.bodyText1,
                textDirection: TextDirection.rtl,
              ),
              Text(
                'تمامی حقوق محفوظ است ©',
                style: theme.textTheme.bodyText1,
                textDirection: TextDirection.rtl,
              ),
              Divider(
                height: 30,
                thickness: 3,
              ),
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
