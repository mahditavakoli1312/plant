import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant/Models/Plants_Model.dart';
import '../URLs.dart';


class GetSimilarProduct{

  // This service is not complete; all that needs to be done is to send some target product information to the api and then return the list of products based on that information.
  // But here we only receive the target product for display and we have nothing to do with this product.


  Future<http.Response> getProducts(Plants plant) async {
    print("send data begining");
    var response = await http.get(Uri.parse(Urls.host+Urls.product_json));
    print("send data finishing");
    print(response.body);
    return response;
  }
}