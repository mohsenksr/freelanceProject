import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/ProviderModels/pricingsModel.dart';

class PricingProvider with ChangeNotifier {
  List<PricingModel> _pricings = [];

  List<PricingModel> get pricings {
    return [..._pricings];
  }

  Future<void> fetchPricings() async {
    final url = 'http://138.201.6.240:8001/api/pricings';
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        throw HttpException('Bad Connection');
      }
      final responseData = json.decode(response.body) as List<dynamic>;
      if (responseData == null) return;
      responseData.forEach((element) {
        _pricings.add(PricingModel(
            id: element['id'],
            title: element['title'],
            description: element['description'],
            price: element['price']));
      });
      notifyListeners();
    } catch (e) {
      // TODO
    }
  }
}
