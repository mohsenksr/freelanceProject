import 'package:flutter/material.dart';
import 'package:project_new_style/models/ProviderModels/pricingsModel.dart';

class PricingsWidget extends StatelessWidget {
  final PricingModel pricingModel;
  PricingsWidget({@required this.pricingModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      color: Colors.teal,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pricingModel.title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                pricingModel.description,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  "هزینه: ${pricingModel.price}",
                  style: TextStyle(color: Colors.white70),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
