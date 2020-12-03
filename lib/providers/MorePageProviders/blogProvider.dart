import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/ProviderModels/blogModel.dart';

class BlogProvider with ChangeNotifier {
  List<BlogModel> _blogs = [];

  List<BlogModel> get blogs {
    return [..._blogs];
  }

  Future<void> fetchAboutUs() async {
    final url = 'http://138.201.6.240:8001/api/blog';
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        throw HttpException('Bad Connection');
      }
      final responseData = json.decode(response.body) as List<dynamic>;
      if (responseData == null) return;
      responseData.forEach((element) {
        _blogs.add(BlogModel(
          id: element['id'],
          content: element['content'],
          title: element['title'],
          updateTime: element['update_time'],
          createTime: element['create_time'],
          imageUrl: element['image'],
          owner: element['owner'],
        ));
      });
      notifyListeners();
    } catch (e) {
      // TODO
    }
  }
}
