import 'package:http/http.dart' show Client;
import 'package:nck/models/title_detail_model.dart';
import 'dart:convert';




class TitleDetailsApi {
    static const endpoint = 'http://ncktech.com/dev/test/public/api/object/';

    Client client = Client();


  Future<TitleDetailModel> fetchTitleDetail(String id) async {
    final response = await client
        .get(endpoint+id);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TitleDetailModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


}