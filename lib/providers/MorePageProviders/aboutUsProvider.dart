import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/ProviderModels/aboutUsModel.dart';

class AboutUsProvider with ChangeNotifier {
  List<Map<String, String>> _aboutUs = [];

  List<Map<String, String>> get aboutUs {
    print(_aboutUs.length);
    return [..._aboutUs];
  }

  Future<void> fetchAboutUs() async {
    final url = 'http://138.201.6.240:8001/api/about-us';
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        throw HttpException('Bad Connection');
      }
      print('helooooo');
      final responseData = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      if (responseData == null) return;
      responseData.forEach((element) {
        _aboutUs.add({
          'question': element['question'],
          'answer': element['answer'],
        });
      });
      notifyListeners();
    } catch (e) {
      //TO DO
    }
  }
}
