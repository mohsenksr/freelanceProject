import 'package:flutter/material.dart';
import 'package:project_new_style/models/ProviderModels/pricingsModel.dart';

class PricingsWidget extends StatelessWidget {
  final PricingModel pricingModel;
  PricingsWidget({@required this.pricingModel});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Card(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pricingModel.title,
                    style: theme.textTheme.headline6,
                  ),
                  Text(
                    pricingModel.description,
                    style: theme.textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      "هزینه: ${pricingModel.price}",
                      style: theme.textTheme.subtitle2,
                      textDirection: TextDirection.rtl,
                    ),
                  ]),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
