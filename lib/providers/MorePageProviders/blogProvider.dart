import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../Setting/serverUrl.dart';

import '../../models/ProviderModels/blogModel.dart';

class BlogProvider with ChangeNotifier {
  List<BlogModel> _blogs;

  List<BlogModel> get blogs {
    return [..._blogs];
  }

  Future<void> fetchBlog() async {
    _blogs = [];
    final url = blogUrl;
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
      throw e;
    }
  }
}
