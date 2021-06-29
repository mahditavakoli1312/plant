import 'dart:convert';
import 'package:http/http.dart' as http;
import '../URLs.dart';


class GetProductsService{
  Future<http.Response> getProducts() async {
    // print("send data begining");
    var response = await http.get(Uri.parse(Urls.host+Urls.product_json));
    // print("send data finishing");
    // print(response.body);
    return response;
  }
}