import 'package:flutter/material.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';

class ProjectAndServiceSuggest extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;

  ProjectAndServiceSuggest(
    this.imageUrl,
    this.price,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      child: Card(
        child: Container(
          width: 180,
          height: 120,
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    // height: _width / 4,
                    width: double.infinity,

                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      colors: [
                        const Color.fromRGBO(0, 0, 0, 0),
                        const Color.fromRGBO(0, 0, 0, 1),
                      ], // red to yellow

                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        textDirection: TextDirection.rtl,
                        style: theme.textTheme.bodyText1,
                      ),
                      Text(
                        getPersianNumbers(price.toString()) + ' تومان',
                        textDirection: TextDirection.rtl,
                        style: theme.textTheme.bodyText1,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}