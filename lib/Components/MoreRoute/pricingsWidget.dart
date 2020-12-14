import 'package:flutter/material.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';
import 'package:project_new_style/models/ProviderModels/pricingsModel.dart';

class PricingsWidget extends StatelessWidget {
  final PricingModel pricingModel;
  PricingsWidget({@required this.pricingModel});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 1),
    //   child: Card(
    //       child: Directionality(
    //         textDirection: TextDirection.rtl,
    //         child: Container(
    //           padding: EdgeInsets.all(16),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 pricingModel.title,
    //                 style: theme.textTheme.headline6,
    //               ),
    //               Text(
    //                 pricingModel.description,
    //                 style: theme.textTheme.bodyText1,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 5.0),
    //                 child: Divider(
    //                   thickness: 2,
    //                 ),
    //               ),
    //               Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    //                 Text(
    //                   "هزینه: ${pricingModel.price}",
    //                   style: theme.textTheme.subtitle2,
    //                   textDirection: TextDirection.rtl,
    //                 ),
    //               ]),
    //             ],
    //           ),
    //         ),
    //       ),
    //   ),
    // );

    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(
            vertical: 1,
            horizontal: 3,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.money,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Text(pricingModel.title,
                            style: theme.textTheme.headline6),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(pricingModel.description,
                      style: theme.textTheme.bodyText1),
                ),
                Divider(
                  height: 10,
                  thickness: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          getPersianNumbers(pricingModel.price.toString()),
                          style: theme.textTheme.bodyText1,
                        ),
                        Text(
                          " تومان",
                          style: theme.textTheme.bodyText1,
                        ),
                      ],
                    ),
                    RaisedButton(
                      child: Text(
                        "پرداخت",
                        style: theme.textTheme.bodyText1,
                      ),
                      onPressed: () => {
                        //TODO
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // Divider(
        //   height: 10,
        // )
      ],
    );
  }
}
