import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<String> retrieveCountry();
}

///////////////////////////////////////////////////////////////////////

class RemoteDataSourceImpl extends RemoteDataSource {
  RemoteDataSourceImpl({required this.productCode});

  String productCode;

  String url = 'https://world.openfoodfacts.org/api/v0/product/';

  @override
  Future<String> retrieveCountry() async {
    String myUrl = url + productCode;
    String data = '';

    Uri uri = Uri.parse(myUrl);
    var response = await http.get(uri);

    Map<String, dynamic> decodedResponse =
        jsonDecode(response.body) as Map<String, dynamic>;

    data = decodedResponse['product']['countries'];

    return data;
  }
}
