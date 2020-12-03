import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/ProviderModels/manualModel.dart';

class ManualProvider with ChangeNotifier {
  List<ManualModel> _manuals;

  List<ManualModel> get manuals {
    return [..._manuals];
  }

  Future<void> fetchManual() async {
    final url = 'http://138.201.6.240:8001/api/manual';
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        throw HttpException('Bad Connection');
      }
      final responseData =
          json.decode(response.body) as List<Map<String, dynamic>>;
      if (responseData == null) return;
      responseData.forEach((element) {
        List<ManualEntry> tempEntry = [];
        element['manual_entries'].forEach((ent) {
          tempEntry.add(ManualEntry(
              id: ent['id'],
              title: ent['title'],
              description: ent['description'],
              imageUrl: ent['imageUrl']));
        });
        _manuals.add(
            ManualModel(title: element['manual_title'], entries: tempEntry));
      });
      notifyListeners();
    } catch (e) {
      // TODO
    }
  }
}
