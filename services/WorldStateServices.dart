import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/WorldStateApi.dart';
import 'Api_url.dart';

class WorldStateServices {
  Future<WorldStateApi> fetchWorldData() async {
    final responce = await http.get(Uri.parse(AppUrl.worldstateapi));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      return WorldStateApi.fromJson(data);
    } else {
      throw Exception('Error Loading \n Check your Internetconnection');
    }
  }

  Future<List<dynamic>> fetchCountryList() async {
    var data;
    final responce = await http.get(
      Uri.parse(AppUrl.countriesList),
    );
    if (responce.statusCode == 200) {
      data = jsonDecode(responce.body);
      return data;
    } else {
      throw Exception('Error Loading \n Check your Internetconnection');
    }
  }
}
