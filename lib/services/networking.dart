import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get('$url',
        headers: {'Authorization': '97206de0-b1819688-6af9c8d0-d5ded771'});

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);

    } else {
      print('${response.statusCode} there was an error');
    }
  }
}
