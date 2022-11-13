import 'dart:async';

import 'package:football_api/model/footballmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/footballmodel.dart';

class Services {
  Future<Footballmodel> getallposts() async {
    Footballmodel footballmodel = Footballmodel();

    String url="https://raw.githubusercontent.com/openfootball/football.json/master/2020/jp.1.clubs.json";
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = convert.jsonDecode(response.body);
        footballmodel = Footballmodel.fromJson(parsed);
        return footballmodel;
      } else {
        return footballmodel;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
    return footballmodel;
  }
}
