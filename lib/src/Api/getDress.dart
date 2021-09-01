import 'dart:convert';

import 'package:http/http.dart' as http;

class Dress {
  final String cardId;
  final String nameJp;
  final String nameCn;
  final int datetime;
  final String character;
  
  Dress({
    required this.cardId,
    required this.nameJp,
    required this.datetime,
    required this.nameCn,
    required this.character
  });

  factory Dress.fromjson(Map<String, dynamic> json){
    return Dress(
      cardId: json['basicInfo']['cardID'],
      nameJp: json['basicInfo']['name']['ja'],
      nameCn: json['basicInfo']['name']['ja'],
      datetime: json["released"]["ja"],
      character: json['basicInfo']['character']
    );
  }
}

Future<List<Dress>> getAllDress(String api) async {
  final response = await http.get(Uri.parse(api));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var dresses = <Dress>[];
    for(var dress in data){
      dresses.add(Dress.fromjson(dress.value));
    }
    return dresses;
  }
  else{
    throw Exception('Failed to load dress');
  }
}