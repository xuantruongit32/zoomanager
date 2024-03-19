import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zoo/services/models/gift.dart';
import 'package:zoo/services/models/house.dart';

class NetworkRequest {
  static const String url1 = 'http://localhost/5000/api/Houses';

  static const String url2 = 'http://localhost/5000/api/gift';
  static List<House> parseHouse(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<House> listHouse = list.map((e) => House.fromJson(e)).toList();
    return listHouse;
  }

  static Future<List<House>> fetchListHouse({int page = 1}) async {
    final response = await http.get(
      Uri.parse(url1),
    );
    if (response.statusCode == 200) {
      return compute(parseHouse, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get house');
    }
  }

  static List<Gift> parseGift(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Gift> listGift = list.map((e) => Gift.fromJson(e)).toList();
    return listGift;
  }

  static Future<List<Gift>> fetchListGift({int page = 1}) async {
    final response = await http.get(
      Uri.parse(url2),
    );
    if (response.statusCode == 200) {
      return compute(parseGift, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get house');
    }
  }
}
