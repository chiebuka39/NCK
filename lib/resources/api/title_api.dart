import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:nck/models/title_model.dart';



class TitleApi {
    static const endpoint = 'http://ncktech.com/dev/test/public/api/objects';

    Client client = Client();


  Future<Titles> fetchTitleList() async {
    print("entered");
    final response = await client
        .get(endpoint);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Titles.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


}