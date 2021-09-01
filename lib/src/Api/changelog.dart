import 'dart:convert';

import 'package:http/http.dart' as http;


Future<String> getLatestVer(String api) async {
  final response = await http.get(Uri.parse(api));
  if (response.statusCode == 200){
    return jsonDecode(response.body)['latest'];
  }
  else{
    throw Exception("Failed to get latest version");
  }
}