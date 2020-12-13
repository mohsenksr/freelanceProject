import 'package:flutter/material.dart';
import 'package:project_new_style/Components/CustomRaisedButton.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class HomeWebAppBar extends StatelessWidget {
  HomeWebAppBar();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.appBarTheme.color,
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 2.0),
              color: theme.appBarTheme.shadowColor,
              blurRadius: 5.0),
        ],
      ),
      // color: theme.appBarTheme.color,
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
                Container(
                  width: 80,
                  height: 40,
                ),
                // InkWell(
                //   child: Card(
                //       shape: RoundedRectangleBorder(
                //         side: BorderSide(color: Colors.black, width: 2),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       color: themeColor,
                //       child: Container(
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           homePageAppBarInstallApp,
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontFamily: mainFontFamily,
                //             fontSize: 12,
                //           ),
                //         ),
                //       )),
                //   onTap: () {},
                // ),
                // InkWell(
                //   child: Card(
                //       shape: RoundedRectangleBorder(
                //         side: BorderSide(color: Colors.black, width: 2),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       color: themeColor,
                //       child: Container(
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           homePageAppBarPricings,
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontFamily: mainFontFamily,
                //             fontSize: 12,
                //           ),
                //         ),
                //       )),
                //   onTap: () => {},
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: CustomRaisedButton(
                    onPressed: () => {},
                    title: homePageAppBarPricings,
                    isDisabled: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: CustomRaisedButton(
                    onPressed: () => {},
                    title: homePageAppBarInstallApp,
                    isDisabled: false,
                  ),
                ),

                Expanded(
                  child: SizedBox.shrink(),
                ),
                Text(
                  homePageAppBarTitle,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: mainFontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 80,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// goToPricings() async {
//   const url = 'http://localhost:43949/#/about-us';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

//TODO: some problems with url_launcher package. so buttons are inactive presently.
