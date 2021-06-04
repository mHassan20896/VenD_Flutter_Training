import 'dart:convert';

import 'package:http/http.dart';

class ResponseHandler {
  dynamic handleResponse(Response rawResponse) {
    if (rawResponse.statusCode == 200) {
      return jsonDecode(rawResponse.body);
    } else if (rawResponse.statusCode == 404) {
      throw Exception("Content not found");
    } else if (rawResponse.statusCode >= 300) {
      throw Exception("Something went wrong, please try again later.");
    }
  }
}
