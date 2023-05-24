import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class QRLocalSource {
  Map? loadResults();
  Future<bool> savdeResults(String result);
}

class QRLocalSourceImpl extends QRLocalSource {
  final SharedPreferences sh;
  final resKey = "/resultsKey";
  QRLocalSourceImpl(this.sh);
  @override
  Map loadResults() {
    String? resData = sh.getString(resKey);

    return resData != null ? json.decode(resData) : {};
  }

  @override
  Future<bool> savdeResults(String result) async {
    String? results = sh.getString(resKey);
    if (results != null) {
      Map<String, dynamic> resultsData = json.decode(results);
      resultsData.addAll({DateTime.now().toIso8601String(): result});
      return sh.setString(resKey, json.encode(resultsData));
    } else {
      return sh.setString(
          resKey, json.encode({DateTime.now().toIso8601String(): result}));
    }
  }
}
