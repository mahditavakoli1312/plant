import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:plant/Services/GetProducts_service.dart';
import 'package:plant/Services/GetSimilarProduct.dart';

Plants plantsFromJson(String str) => Plants.fromJson(json.decode(str));

String plantsToJson(Plants data) => json.encode(data.toJson());

class Plants {
  int id;
  String name;
  String item;
  String website;
  String description;
  String image;
  double rate;
  String price;

  Plants(this.id, this.name, this.item, this.website, this.description,
      this.image, this.rate, this.price);


  factory Plants.fromJson(Map<String, dynamic> json) => Plants(json['id'],json['name'],json['item'],json['website'],json['description'],json['image'],json['rate'],json['price']);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "item": item,
    "website": website,
    "description": description,
    "image": image,
    "rate": rate,
    "price": price,
  };

  // for read from local json file
  static Future<List<Plants>> loadJsonData() async{
     var jsonText = await rootBundle.loadString('assets/data.json');
     List<dynamic> list = json.decode(jsonText);
    List<Plants> plantList=[] ;
    for(var p in list){
      int id = p['id'];
      String name = p['name'];
      String item = p['item'];
      String website = p['website'];
      String description = p['description'];
      String image = p['image'];
      double rate = p['rate'];
      String price = p['price'];
      Plants pp = Plants(id, name, item, website, description, image, rate, price);
      plantList.add(pp);
    }
     return Future.delayed(const Duration(seconds: 3),(){
      return plantList;
    });
  }
  // for get data from prtn.ir 'my host'
  static Future<List<Plants>> getProducts() async{
    List<Plants> plantsList = [];
    Response response = await( new GetProductsService()).getProducts();
    List<dynamic> list = json.decode(response.body);
    List<Plants> plantList=[] ;
    for(var p in list){
      int id = p['id'];
      String name = p['name'];
      String item = p['item'];
      String website = p['website'];
      String description = p['description'];
      String image = p['image'];
      double rate = p['rate'];
      String price = p['price'];
      Plants pp = Plants(id, name, item, website, description, image, rate, price);
      plantList.add(pp);
    }
    return plantList;
  }
  static Future<List<Plants>> getSimilarProducts(Plants targetPlant) async{
    List<Plants> plantsList = [];
    Response response = await( new GetSimilarProduct()).getProducts(targetPlant);
    List<dynamic> list = json.decode(response.body);
    List<Plants> plantList=[] ;
    for(var p in list){
      int id = p['id'];
      String name = p['name'];
      String item = p['item'];
      String website = p['website'];
      String description = p['description'];
      String image = p['image'];
      double rate = p['rate'];
      String price = p['price'];
      Plants pp = Plants(id, name, item, website, description, image, rate, price);
      plantList.insert(0, pp);
      print("!!@!@!@"+plantList.length.toString());
    }
    return plantList;
  }
}

