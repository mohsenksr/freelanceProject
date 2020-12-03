import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/ProviderModels/ruleModel.dart';

class RuleProvider with ChangeNotifier {
  List<Map<String, String>> _rules = [];

  List<Map<String, String>> get rules {
    return [..._rules];
  }

  Future<void> fetchRules() async {
    final url = 'http://138.201.6.240:8001/api/rules';
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        throw HttpException('Bad Connection');
      }
      final responseData = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      if (responseData == null) return;
      responseData.forEach((element) {
        _rules.add({
          'question': element['title'],
          'answer': element['description'],
        });
      });
      notifyListeners();
    } catch (e) {
      // TODO
    }
  }
}
