import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ApiNetworking{

  ApiNetworking({@required this.url});
  String url;

  Future<dynamic> getWorldData() async{
    Response response = await get(url);
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }else {
      print(response.statusCode);
    }
  }

  // ignore: missing_return
  Future<List<Country>> mostAffected() async{
    Response response = await get(url);
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Country> countries = [];
      for(var u in data){
        Country country = Country(u['countryInfo']['flag'],u['country'],u['cases'],u['active'],u['deaths'],u['recovered']);
        countries.add(country);
      }
      return countries;
    }else {
      print(response.statusCode);
    }
  }

}

class Country{
  final String flag;
  final String name;
  final int cases;
  final int active;
  final int death;
  final int recovered;

  Country(this.flag, this.name, this.cases, this.active, this.death,this.recovered);

}

